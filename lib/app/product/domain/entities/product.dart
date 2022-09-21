import 'product_options.dart';
import 'product_variant.dart';

class Product {
  int? v;
  String id;
  String createdAt;
  String productName;
  ProductOptions? productOptions;
  List<ProductVariant>? productVariants;
  String updatedAt;

  Product(
      {required this.v,
      required this.id,
      required this.createdAt,
      required this.productName,
      required this.productOptions,
      required this.productVariants,
      required this.updatedAt});

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      v: json['__v'],
      id: json['_id'],
      createdAt: json['createdAt'],
      productName: json['productName'],
      productOptions: json['productOptions'] != null
          ? ProductOptions.fromJson(json['productOptions'])
          : null,
      productVariants: json['productVariants'] != null
          ? (json['productVariants'] as List)
              .map((i) => ProductVariant.fromJson(i))
              .toList()
          : null,
      updatedAt: json['updatedAt'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['__v'] = v;
    data['_id'] = id;
    data['createdAt'] = createdAt;
    data['productName'] = productName;
    data['updatedAt'] = updatedAt;
    if (productOptions != null) {
      data['productOptions'] = productOptions?.toJson();
    }
    if (productVariants != null) {
      data['productVariants'] =
          productVariants?.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
