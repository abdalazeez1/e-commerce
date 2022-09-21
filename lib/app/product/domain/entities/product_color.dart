import 'package:aroundix_store/app/product/domain/entities/product_color_image.dart';

class ProductColor {
  final String id;
  final List<ProductColorImage>? colorImages;
  final String colorName;
  final bool isSelected;

  ProductColor(
      {this.isSelected = false,
      required this.id,
      required this.colorImages,
      required this.colorName});

  factory ProductColor.fromJson(Map<String, dynamic> json) {
    return ProductColor(
      id: json['_id'],
      colorImages: json['colorImages'] != null
          ? List<ProductColorImage>.from((json['colorImages'] as List)
              .map((e) => ProductColorImage(colorImage:e))
              .toList())
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

  ProductColor copyWith({bool? isSelected}) => ProductColor(
      colorName: colorName,
      id: id,
      colorImages: colorImages,
      isSelected: isSelected ?? !this.isSelected);
}
