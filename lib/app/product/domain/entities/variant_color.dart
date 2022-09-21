
class VariantColor {
  String colorName;

  VariantColor({required this.colorName});

  factory VariantColor.fromJson(Map<String, dynamic> json) {
    return VariantColor(
      colorName: json['colorName'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['colorName'] = colorName;
    return data;
  }
}
