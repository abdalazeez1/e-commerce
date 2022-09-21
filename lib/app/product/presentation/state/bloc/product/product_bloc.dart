import 'package:aroundix_core/core.dart';
import 'package:aroundix_store/app/product/domain/entities/param/param_add_to_product.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import '../../../../../../injection/service_locator.dart';
import '../../../../application/facade.dart';
import '../../../../domain/entities/Product.dart';

part 'product_event.dart';

part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final ProductFacade _facade;

  ProductBloc({required ProductFacade facade})
      : _facade = facade,
        super(const ProductState()) {
    on<ProductEvent>((event, emit) async {
      if (event is GetAllProduct) {
        await getAllProduct(event, emit);
        return;
      }
      if (event is GetProductById) {
        await getProductById(event, emit);
        return;
      }
      if (event is AddProduct) {
        await addProduct(event, emit);
        return;
      }
      if (event is ResetAddProduct) {
        emit(state.copyWith(addProductStatus: const BlocStatus.initial()));
      }
      if (event is PopFromDetailProduct) {
        emit(state.copyWith(product: const PageState.init()));
      }
    });
  }

  addProduct(AddProduct event, emit) async {
    emit(state.copyWith(addProductStatus: const BlocStatus.loading()));

    final result =
        await _facade.addProduct(paramAddToProduct: event.paramAddProduct);
    result.when(
      success: (data) {
        return emit(
            state.copyWith(addProductStatus: const BlocStatus.success()));
      },
      failure: (String message, AppException<dynamic> exception) => emit(
          state.copyWith(addProductStatus: BlocStatus.fail(error: message))),
    );
  }

  getAllProduct(event, emit) async {
    emit(state.copyWith(allProducts: const PageState.loading()));

    final result = await _facade.getAllProducts();
    result.when(
      success: (data) {
        return emit(state.copyWith(allProducts: PageState.loaded(data: data)));
      },
      failure: (String message, AppException<dynamic> exception) => emit(
          state.copyWith(
              allProducts:
                  PageState.error(exception: exception, error: message))),
    );
  }

  getProductById(GetProductById event, emit) async {
    emit(state.copyWith(product: const PageState.loading()));

    final result = await _facade.getProductBYId(productId: event.productId);
    result.when(
      success: (data) =>
          emit(state.copyWith(product: PageState.loaded(data: data))),
      failure: (String message, AppException<dynamic> exception) => emit(
          state.copyWith(
              product: PageState.error(exception: exception, error: message))),
    );
  }

  @override
  Future<void> close() {
    si.resetLazySingleton<ProductBloc>();
    return super.close();
  }
}
