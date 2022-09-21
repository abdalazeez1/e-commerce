import 'package:aroundix_store/app/product/domain/entities/product_color_image.dart';
import 'package:flutter/foundation.dart';

import '../../domain/entities/Product.dart';
import '../../domain/entities/product_options.dart';
import '../../domain/entities/product_color.dart';

const String typeSize = "Size";

class SelectPieceProvider extends ChangeNotifier {
  SelectPieceProvider({required this.product}) {
    product.productOptions?.productSizes?.first =
        product.productOptions!.productSizes!.first.copyWith(isSelected: true);
    for (int i = 0;i<(product.productOptions?.productColors?.length??0); i++) {
      product.productOptions!.productColors![i].colorImages!.first = product
          .productOptions!.productColors![i].colorImages!.first
          .copyWith(isSelected: true);
    }
    product.productOptions?.productColors?.first =
        product.productOptions!.productColors!.first.copyWith(isSelected: true);
    currentIndexImage = 0;

    selectedSize = product.productOptions!.productSizes!.first;
    selectColor = product.productOptions!.productColors!.first;
    notifyListeners();
  }

  List<String> getImageByIndexColorImage(int index) =>
      product.productOptions?.productColors?[index].colorImages
          ?.map((e) => e.colorImage)
          .toList() ??
      [];

  List<ProductSize> get getSize => product.productOptions?.productSizes ?? [];

  List<ProductColor> get getColor =>
      product.productOptions?.productColors ?? [];
  late int currentIndexImage;

  String get getImageSelected =>
      product.productOptions?.productColors?[indexColorNameSelected ?? 0]
          .colorImages?[currentIndexImage].colorImage ??
      '';

  List<ProductColorImage> get getListImages =>
      product.productOptions!.productColors![indexColorNameSelected ?? 0]
          .colorImages ??
      [];

  List<bool> get isSelectedImage => (product.productOptions
              ?.productColors?[indexColorNameSelected ?? 0].colorImages ??
          [])
      .map((e) => e.isSelected)
      .toList();

  ///size
  // ProductSize? size;
  late ProductSize selectedSize;

  List<bool> get isSelectedSize =>
      product.productOptions?.productSizes?.map((e) => e.isSelected).toList() ??
      [];

  int? get indexColorNameSelected {
    int index = (product.productOptions?.productColors ?? [])
        .indexWhere((element) => element.isSelected);
    if (index < 0) return null;
    return index;
  }

  ///color
  ProductColor? selectColor;

  late List<ProductColor> color;

  List<bool> get isSelectedColor =>
      product.productOptions?.productColors
          ?.map((e) => e.isSelected)
          .toList() ??
      [];

  Product product;

  void onSelectImage(int index) {
    int indexWhere = isSelectedImage.indexWhere((element) => element == true);
    if (indexWhere < 0) {
      return;
    }
    if (indexColorNameSelected != null) {
      product.productOptions?.productColors?[indexColorNameSelected!]
              .colorImages![indexWhere] =
          product.productOptions!.productColors![indexColorNameSelected!]
              .colorImages![indexWhere]
              .copyWith();
      product.productOptions?.productColors?[indexColorNameSelected!]
              .colorImages![index] =
          product.productOptions!.productColors![indexColorNameSelected!]
              .colorImages![index]
              .copyWith();
      currentIndexImage = index;
      notifyListeners();
    }
  }

  void onSelectSize(int index) {
    List<ProductSize>? list = product.productOptions?.productSizes;
    var index2 = list?.indexWhere((element) => element.isSelected == true);
    if (index2 == null || index2 < 0) {
      return;
    }
    list?[index2] = list[index2].copyWith();
    list?[index] = list[index].copyWith();
    selectedSize = list![index];
    notifyListeners();
  }

  void onSelectColor(int index) {
    var index2 = product.productOptions?.productColors
        ?.indexWhere((element) => element.isSelected == true);
    if (index2 == null || index2 < 0) {
      return;
    }
    product.productOptions?.productColors?[index2] =
        product.productOptions!.productColors![index2].copyWith();

    selectColor = product.productOptions?.productColors![index];
    product.productOptions?.productColors?[index] =
        product.productOptions!.productColors![index].copyWith();
    currentIndexImage = 0;
    notifyListeners();
  }

  String getPriceByVariant() {
    return product.productVariants
            ?.firstWhere((element) =>
                element.variantAttributes?.variantColor?.colorName ==
                    selectColor?.colorName &&
                element.variantAttributes?.variantSize ==
                    selectedSize.productSize)
            .variantPrice ??
        '????';
  }
}
