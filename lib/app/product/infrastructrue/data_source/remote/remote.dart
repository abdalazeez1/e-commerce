import 'package:aroundix_core/core.dart';
import 'package:aroundix_network/p_http_client.dart';

import '../../../../../common/const/const.dart';
import '../../../domain/entities/param/param_add_to_product.dart';
import '../../model/Product.dart';

class ProductRemote {
  final Dio _dio;

  ProductRemote(this._dio);

  Future<List<ProductDTO>> getAllProducts() async {
    return throwAppException(
      () async {
        final response = await _dio.get(APIRoutes.product.getAllProducts);
        return ProductDTO.fromJsonToModel(response.data['products']);
      },
    );
  }

  Future<ProductDTO> getProductBYId({required String productId}) async {
    return throwAppException(
      () async {
        final response = await _dio.get('${APIRoutes.product.getProductById}/$productId');
        return ProductDTO.fromJson(response.data['product']);
      },
    );
  }

  Future<void> addProduct(
      {required ParamAddProduct paramAddToProduct}) async {
    return throwAppException(() async {
      final formDate =await paramAddToProduct.toMap();
     await _dio.post(APIRoutes.product.addProduct,
          data: FormData.fromMap(formDate));
    });
  }
}
