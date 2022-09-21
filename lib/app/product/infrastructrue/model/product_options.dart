
import 'package:aroundix_store/app/product/infrastructrue/model/product_color.dart';

import '../../domain/entities/product_options.dart';

class ProductOptionsDTO {
  List<ProductColorDTO>? productColors;
  List<String>? productSizes;

  ProductOptionsDTO({required this.productColors, required this.productSizes});

  static ProductOptionsDTO fromJson(Map<String, dynamic> json) {
    return ProductOptionsDTO(
      productColors: json['productColors'] != null
          ? (json['productColors'] as List)
              .map((i) => ProductColorDTO.fromJson(i))
              .toList()
          : null,
      productSizes: json['productSizes'] != null
          ? List<String>.from(json['productSizes'])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (productColors != null) {
      data['productColors'] = productColors?.map((v) => v.toJson()).toList();
    }
    if (productSizes != null) {
      data['productSizes'] = productSizes;
    }
    return data;
  }

  ProductOptions toAppModel() => ProductOptions(
      productColors: ProductColorDTO.fromModelToDomain(productColors),
      productSizes: productSizes?.map((e) => ProductSize(productSize: e)).toList());

  static List<ProductOptions> fromJsonToDomain(List<dynamic> list) =>
      list.map((e) => fromJson(e).toAppModel()).toList();

  static List<ProductOptions> fromModelToDomain(List<ProductOptionsDTO> list) =>
      list.map((e) => e.toAppModel()).toList();

  static List<ProductOptionsDTO> fromJsonToModel(List<dynamic> list) =>
      list.map((e) => fromJson(e)).toList();
}
