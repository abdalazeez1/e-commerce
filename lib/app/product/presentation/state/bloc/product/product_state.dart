part of 'product_bloc.dart';

class ProductState extends Equatable {
  final PageState<List<Product>> allProducts;
  final PageState<Product> product;
  final BlocStatus addProductStatus;

  const ProductState({
    this.addProductStatus = const BlocStatus.initial(),
    this.allProducts = const PageState.init(),
    this.product = const PageState.init(),
  });

  copyWith({
    BlocStatus? addProductStatus,
    ParamAddProduct? paramAddToProduct,
    PageState<List<Product>>? allProducts,
    PageState<Product>? product,
  }) =>
      ProductState(
          addProductStatus: addProductStatus ?? this.addProductStatus,
          allProducts: allProducts ?? this.allProducts,
          product: product ?? this.product);

  @override
  List get props => [allProducts, product, addProductStatus];
}
