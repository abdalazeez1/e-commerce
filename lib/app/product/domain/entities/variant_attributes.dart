import 'package:aroundix_store/app/product/domain/entities/variant_color.dart';


class VariantAttributes {
  VariantColor? variantColor;
  String variantSize;

  VariantAttributes({required this.variantColor, required this.variantSize});

  factory VariantAttributes.fromJson(Map<String, dynamic> json) {
    return VariantAttributes(
      variantColor: json['variantColor'] != null
          ? VariantColor.fromJson(json['variantColor'])
          : null,
      variantSize: json['variantSize'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['variantSize'] = variantSize;
    if (variantColor != null) {
      data['variantColor'] = variantColor?.toJson();
    }
    return data;
  }
}
