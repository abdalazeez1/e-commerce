
import 'package:aroundix_store/app/product/domain/entities/Product.dart';
import 'package:aroundix_store/app/product/infrastructrue/model/product_options.dart';
import 'package:aroundix_store/app/product/infrastructrue/model/product_variant.dart';


class ProductDTO {
  int? v;
  String id;
  String createdAt;
  String productName;
  ProductOptionsDTO? productOptions;
  List<ProductVariantDTO>? productVariants;
  String updatedAt;

  ProductDTO(
      {required this.v,
      required this.id,
      required this.createdAt,
      required this.productName,
      required this.productOptions,
      required this.productVariants,
      required this.updatedAt});

  static ProductDTO fromJson(Map<String, dynamic> json) {
    return ProductDTO(
      v: json['__v'],
      id: json['_id'],
      createdAt: json['createdAt'],
      productName: json['productName'],
      productOptions: json['productOptions'] != null
          ? ProductOptionsDTO.fromJson(json['productOptions'])
          : null,
      productVariants: json['productVariants'] != null
          ? (json['productVariants'] as List)
              .map((i) => ProductVariantDTO.fromJson(i))
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

  Product toAppModel() => Product(
      v: v,
      id: id,
      createdAt: createdAt,
      productName: productName,
      productOptions: productOptions?.toAppModel(),
      productVariants: ProductVariantDTO.fromModelToDomain(productVariants),
      updatedAt: updatedAt);

  static List<Product> fromJsonToDomain(List<dynamic> list) =>
      list.map((e) => fromJson(e).toAppModel()).toList();

  static List<Product>? fromModelToDomain(List<ProductDTO>? list) =>
      list?.map((e) => e.toAppModel()).toList();

  static List<ProductDTO> fromJsonToModel(List<dynamic> list) =>
      list.map((e) => fromJson(e)).toList();
}
