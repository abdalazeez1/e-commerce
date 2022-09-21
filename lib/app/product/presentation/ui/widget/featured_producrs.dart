import 'package:aroundix_design/design.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

import '../../../domain/entities/Product.dart';
import 'grid_product_with_animation.dart';

class FeaturedProducts extends StatelessWidget {
  const FeaturedProducts({
    Key? key,
    this.padding,
    this.product = const [],
  }) : super(key: key);

  final List<Product> product;
  final EdgeInsets? padding;

  @override
  Widget build(BuildContext context) {
    return AnimationLimiter(
      child: RPadding(
        padding: padding ?? PEdgeInsets.listView,
        child: GridView.builder(
          shrinkWrap: false,
          itemCount: product.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 10.h,
            crossAxisSpacing: 20.h,
            childAspectRatio: 7 / 8,

            ///cross /main
          ),
          itemBuilder: (context, index) => GridProductsWithAnimation(
            index: index,
            product: product[index],
          ),
        ),
      ),
    );
  }
}
