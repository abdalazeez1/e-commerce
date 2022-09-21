import 'package:flutter/material.dart';

import '../../../domain/entities/Product.dart';
import '../screen/products_screen.dart';
import 'animation_product.dart';

class GridProductsWithAnimation extends StatelessWidget {
  const GridProductsWithAnimation(
      {Key? key, required this.product, required this.index})
      : super(key: key);
  final int index;
  final Product product;

  @override
  Widget build(BuildContext context) {
    return AnimationProductWidget(product: product, index: index);
  }
}
