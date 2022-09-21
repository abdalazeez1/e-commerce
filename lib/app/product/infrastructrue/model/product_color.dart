
import 'package:aroundix_store/app/product/domain/entities/product_color_image.dart';

import '../../domain/entities/product_color.dart';

class ProductColorDTO {
  String id;
  List<String>? colorImages;
  String colorName;

  ProductColorDTO(
      {required this.id, required this.colorImages, required this.colorName});

  static ProductColorDTO fromJson(Map<String, dynamic> json) {
    return ProductColorDTO(
      id: json['_id'],
      colorImages: json['colorImages'] != null
          ? List<String>.from(json['colorImages'])
          : null,
      colorName: json['colorName'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = id;
    data['colorName'] = colorName;
    if (colorImages != null) {
      data['colorImages'] = colorImages;
    }
    return data;
  }

  ProductColor toAppModel() => ProductColor(
      id: id,
      colorImages: colorImages
          ?.map((e) => ProductColorImage(colorImage: e))
          .toList(),
      colorName: colorName);

  static List<ProductColor> fromJsonToDomain(List<dynamic> list) =>
      list.map((e) => fromJson(e).toAppModel()).toList();

  static List<ProductColor>? fromModelToDomain(List<ProductColorDTO>? list) =>
      list?.map((e) => e.toAppModel()).toList();

  static List<ProductColorDTO> fromJsonToModel(List<dynamic> list) =>
      list.map((e) => fromJson(e)).toList();
}
