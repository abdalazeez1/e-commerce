import 'package:aroundix_core/core.dart';

import '../entities/Product.dart';
import '../entities/param/param_add_to_product.dart';

abstract class IProductRepo {
  Future<ApiResult<void>> addProduct(
      {required ParamAddProduct paramAddToProduct});

  Future<ApiResult<Product>> getProductBYId({required String productId});

  Future<ApiResult<List<Product>>> getAllProducts();
}
