import 'package:aroundix_design/design.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../../common/widget/tedt_flexible_body.dart';
import '../../../domain/entities/Product.dart';
import '../../../domain/entities/product_options.dart';
import '../screen/detail_product_screen.dart';

class ProductWidget extends StatelessWidget {
  const ProductWidget(
      {Key? key, required this.product, required this.index, this.dim})
      : super(key: key);
  final Size? dim;
  final int index;
  final Product product;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.pushNamed(DetailProductScreen.name, queryParams: {
          "id": product.id.toString(),
          "index": index.toString()
        });
      },
      child: Container(
        height: dim?.height,
        width: dim?.width,
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(
            border: kBorderHalf, borderRadius: PBorderRadius.borderRadiusAllM1),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
              flex: 4,
              child: Stack(
                fit: StackFit.expand,
                clipBehavior: Clip.none,
                children: [
                  CustomImage(
                    path: product.productOptions?.productColors?.first
                        .colorImages?.first.colorImage ??
                        '',
                    fit: BoxFit.fill,
                  ),
                  // _RenderNewWidget(product: product),
                ],
              ),
            ),
            Space.vS3,

            // const CustomRatingWidget(),
            TextFlexibleBody(
              text: product.productName,
            ),
            Space.vS1,
            //
            RPadding(
              padding: REdgeInsets.symmetric(horizontal: LayoutConstrains.s3),
              child: Wrap(
                children: List<Widget>.of(product.productOptions?.productSizes
                    ?.map(
                      (ProductSize e) => Card(
                      margin: REdgeInsets.all(LayoutConstrains.s1),
                      child: Text(
                        "  ${e.productSize}  ",
                        style: Theme.of(context)
                            .textTheme
                            .labelSmall
                            ?.copyWith(fontSize: 8),
                      )),
                )
                    .toList() as List<Widget>)
                  ..insert(
                      0,
                      Text(
                        'Size: ',
                        style: Theme.of(context).textTheme.labelSmall?.copyWith(
                            fontSize: 8, fontWeight: FontWeight.w300),
                      )),
              ),
            )
          ],
        ),
      ),
    );
  }
}
