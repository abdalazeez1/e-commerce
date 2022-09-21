import 'package:aroundix_store/app/product/domain/entities/product_color.dart';

class ProductOptions {
final  List<ProductColor>? productColors;
final  List<ProductSize>? productSizes;

  ProductOptions({required this.productColors, required this.productSizes});

  factory ProductOptions.fromJson(Map<String, dynamic> json) {
    return ProductOptions(
      productColors: json['productColors'] != null
          ? (json['productColors'] as List)
              .map((i) => ProductColor.fromJson(i))
              .toList()
          : null,
      productSizes: json['productSizes'] != null
          ? List<ProductSize>.from((json['productSizes'] as List)
              .map((e) => ProductSize(productSize: e))
              .toList())
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
}

class ProductSize {
  final String productSize;
  final bool isSelected;

  ProductSize({required this.productSize, this.isSelected = false});

  ProductSize copyWith({bool? isSelected}) => ProductSize(
      productSize: productSize, isSelected: isSelected ?? !this.isSelected);
}
