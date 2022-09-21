import 'package:aroundix_core/core.dart';

import 'package:aroundix_store/app/product/domain/entities/Product.dart';

import 'package:aroundix_store/app/product/domain/entities/param/param_add_to_product.dart';

import '../../domain/repo/repo.dart';
import '../data_source/remote/remote.dart';
import '../model/Product.dart';

class ProductRepoImpl implements IProductRepo {
  final ProductRemote _remote;

  ProductRepoImpl({required ProductRemote remote}) : _remote = remote;

  @override
  Future<ApiResult<void>> addProduct(
      {required ParamAddProduct paramAddToProduct}) {
    return toApiResult(() async {

    await _remote.addProduct(paramAddToProduct: paramAddToProduct);
    });
  }

  @override
  Future<ApiResult<List<Product>>> getAllProducts() {
    return toApiResult(() async {
      final result = await _remote.getAllProducts();
      return ProductDTO.fromModelToDomain(result)??[];
    });
  }

  @override
  Future<ApiResult<Product>> getProductBYId({required String productId}) {
    return toApiResult(() async {
      final result = await _remote.getProductBYId(productId: productId);
      return result.toAppModel();
    });
  }


}
