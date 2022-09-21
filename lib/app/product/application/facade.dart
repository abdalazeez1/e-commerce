import 'package:aroundix_core/core.dart';
import 'package:aroundix_store/app/user/api.dart';

import '../../user/domain/entities/response_user_info.dart';
import '../domain/entities/Product.dart';
import '../domain/entities/param/param_add_to_product.dart';
import '../domain/repo/repo.dart';

class ProductFacade {
  final IProductRepo _repo;
  final UserApi _userApi;

  ProductFacade({
    required UserApi userApi,
    required IProductRepo repo,
  })  : _repo = repo,
        _userApi = userApi;

  Future<ApiResult<ResponseUserInfo>> getUserInfo() {
    return _userApi.getUserInfo();
  }

  Future<ApiResult<void>> addProduct(
          {required ParamAddProduct paramAddToProduct}) async =>
      _repo.addProduct(paramAddToProduct: paramAddToProduct);

  Future<ApiResult<Product>> getProductBYId(
          {required String productId}) async =>
      _repo.getProductBYId(productId: productId);

  Future<ApiResult<List<Product>>> getAllProducts() async =>
      _repo.getAllProducts();
}
