import 'dart:io';
import 'package:equatable/equatable.dart';

class ColorAndImage extends Equatable {
  final String color;
  final bool isSelected;
  final List<File> images;
  final int price;
  final String id;

  ColorAndImage({
    this.isSelected = false,
    required this.color,
    required this.images,
    required this.price,
  }) : id = DateTime.now().toIso8601String();

  String string() => DateTime.now().toString();

  copyWithIsSelected() => ColorAndImage(
      color: color, images: images, price: price, isSelected: !isSelected);

  copyWith({bool? isSelected, File? image}) => ColorAndImage(
      color: color,
      images: (image != null ? (List.of(images)..add(image)) : images),
      price: price,
      isSelected: isSelected ?? this.isSelected);

  @override
  List<Object?> get props => [color, isSelected, images, price, id];
}
