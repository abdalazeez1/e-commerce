

import '../../domain/entities/variant_attributes.dart';
import 'variant_color.dart';

class VariantAttributesDTO {
  VariantColorDTO? variantColor;
  String variantSize;

  VariantAttributesDTO({required this.variantColor, required this.variantSize});

  static VariantAttributesDTO fromJson(Map<String, dynamic> json) {
    return VariantAttributesDTO(
      variantColor: json['variantColor'] != null
          ? VariantColorDTO.fromJson(json['variantColor'])
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

  VariantAttributes toAppModel() => VariantAttributes(
      variantColor: variantColor?.toAppModel(), variantSize: variantSize);

  static List<VariantAttributes> fromJsonToDomain(List<dynamic> list) =>
      list.map((e) => fromJson(e).toAppModel()).toList();

  static List<VariantAttributes> fromModelToDomain(
          List<VariantAttributesDTO> list) =>
      list.map((e) => e.toAppModel()).toList();

  static List<VariantAttributesDTO> fromJsonToModel(List<dynamic> list) =>
      list.map((e) => fromJson(e)).toList();
}
