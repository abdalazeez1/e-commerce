

import 'package:aroundix_store/app/product/infrastructrue/model/variant_attributes.dart';

import '../../domain/entities/product_variant.dart';

class ProductVariantDTO {
  int v;
  String id;
  String createdAt;
  String productId;
  String updatedAt;
  VariantAttributesDTO? variantAttributes;
  String variantPrice;

  ProductVariantDTO(
      {required this.v,
      required this.id,
      required this.createdAt,
      required this.productId,
      required this.updatedAt,
      required this.variantAttributes,
      required this.variantPrice});

  static ProductVariantDTO fromJson(Map<String, dynamic> json) {
    return ProductVariantDTO(
      v: json['__v'],
      id: json['_id'],
      createdAt: json['createdAt'],
      productId: json['productId'],
      updatedAt: json['updatedAt'],
      variantAttributes: json['variantAttributes'] != null
          ? VariantAttributesDTO.fromJson(json['variantAttributes'])
          : null,
      variantPrice: json['variantPrice'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['__v'] = v;
    data['_id'] = id;
    data['createdAt'] = createdAt;
    data['productId'] = productId;
    data['updatedAt'] = updatedAt;
    data['variantPrice'] = variantPrice;
    if (variantAttributes != null) {
      data['variantAttributes'] = variantAttributes?.toJson();
    }

    return data;
  }

  ProductVariant toAppModel() => ProductVariant(
      v: v,
      id: id,
      createdAt: createdAt,
      productId: productId,
      updatedAt: updatedAt,
      variantAttributes: variantAttributes?.toAppModel(),
      variantPrice: variantPrice);

  static List<ProductVariant> fromJsonToDomain(List<dynamic> list) =>
      list.map((e) => fromJson(e).toAppModel()).toList();

  static List<ProductVariant>? fromModelToDomain(
          List<ProductVariantDTO>? list) =>
      list?.map((e) => e.toAppModel()).toList();

  static List<ProductVariantDTO> fromJsonToModel(List<dynamic> list) =>
      list.map((e) => fromJson(e)).toList();
}
