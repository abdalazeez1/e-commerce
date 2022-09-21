import 'package:aroundix_store/app/product/presentation/ui/widget/product_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

import '../../../domain/entities/Product.dart';

class AnimationProductWidget extends StatelessWidget {
  const AnimationProductWidget({
    Key? key,
    required this.product,
    required this.index,
  }) : super(key: key);

  final int index;
  final Product product;

  @override
  Widget build(BuildContext context) {
    return AnimationConfiguration.staggeredGrid(
      position: index,
      duration: const Duration(milliseconds: 375),
      columnCount: 2,
      child: SlideAnimation(
        verticalOffset: 50.0,
        horizontalOffset: 50,
        child: ScaleAnimation(
          child: FadeInAnimation(
            duration: const Duration(milliseconds: 200),
            child: ProductWidget(index: index, product: product),
          ),
        ),
      ),
    );
  }
}
