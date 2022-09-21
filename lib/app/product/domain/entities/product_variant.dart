



import 'package:aroundix_store/app/product/domain/entities/variant_attributes.dart';


class ProductVariant {
  int v;
  String id;
  String createdAt;
  String productId;
  String updatedAt;
  VariantAttributes? variantAttributes;
  String variantPrice;

  ProductVariant(
      {required this.v,
      required this.id,
      required this.createdAt,
      required this.productId,
      required this.updatedAt,
      required this.variantAttributes,
      required this.variantPrice});

  factory ProductVariant.fromJson(Map<String, dynamic> json) {
    return ProductVariant(
      v: json['__v'],
      id: json['_id'],
      createdAt: json['createdAt'],
      productId: json['productId'],
      updatedAt: json['updatedAt'],
      variantAttributes: json['variantAttributes'] != null
          ? VariantAttributes.fromJson(json['variantAttributes'])
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
}
