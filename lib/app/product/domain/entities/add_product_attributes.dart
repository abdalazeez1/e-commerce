import 'package:equatable/equatable.dart';
import 'color_and_image.dart';

class AddProductAttributes extends Equatable {
  final String size;
  final bool isSelected;
  final String id;
  final List<ColorAndImage>? colorAndImage;

  AddProductAttributes({
    this.isSelected = false,
    required this.size,
    this.colorAndImage,
  }) : id = DateTime.now().toIso8601String();

  copyWithIsSelected() => AddProductAttributes(
      size: size, colorAndImage: colorAndImage, isSelected: !isSelected);

  AddProductAttributes copyWith(
          {bool? isSelected, List<ColorAndImage>? colorAndImage}) =>
      AddProductAttributes(
          size: size,
          colorAndImage: colorAndImage ?? this.colorAndImage,
          isSelected: isSelected ?? this.isSelected);

  @override
  List<Object?> get props => [size, isSelected, id];
}
