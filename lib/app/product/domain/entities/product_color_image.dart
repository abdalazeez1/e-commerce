import 'package:equatable/equatable.dart';

class ProductColorImage extends Equatable {
  final String colorImage;
  final bool isSelected;

  const ProductColorImage({required this.colorImage, this.isSelected = false});

  copyWith({bool? isSelected}) =>
      ProductColorImage(colorImage: colorImage, isSelected:isSelected?? !this.isSelected);

  @override
  List<Object?> get props => [colorImage, isSelected];
}
