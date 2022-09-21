
import '../../domain/entities/variant_color.dart';

class VariantColorDTO {
  String colorName;

  VariantColorDTO({required this.colorName});

  static VariantColorDTO fromJson(Map<String, dynamic> json) {
    return VariantColorDTO(
      colorName: json['colorName'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['colorName'] = colorName;
    return data;
  }

  VariantColor toAppModel() => VariantColor(colorName: colorName);

  static List<VariantColor> fromJsonToDomain(List<dynamic> list) =>
      list.map((e) => fromJson(e).toAppModel()).toList();

  static List<VariantColor> fromModelToDomain(List<VariantColorDTO> list) =>
      list.map((e) => e.toAppModel()).toList();

  static List<VariantColorDTO> fromJsonToModel(List<dynamic> list) =>
      list.map((e) => fromJson(e)).toList();
}
