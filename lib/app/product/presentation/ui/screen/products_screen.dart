
import 'package:aroundix_core/core.dart';
import 'package:aroundix_design/design.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:go_router/go_router.dart';

import '../../../../../common/widget/tedt_flexible_body.dart';
import '../../../../../injection/service_locator.dart';
import '../../../domain/entities/Product.dart';
import '../../../domain/entities/product_options.dart';
import '../../state/bloc/product/product_bloc.dart';
import 'detail_product_screen.dart';

class ProductsScreen extends StatelessWidget {
  const ProductsScreen({Key? key}) : super(key: key);
  static String path = 'products-screen';
  static String name = 'products-screen';

  static Page pageBuilder(BuildContext context, GoRouterState state) =>
      MaterialPage(
        key: state.pageKey,
        child: const ProductsScreen(),
      );

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: si<ProductBloc>()..add(GetAllProduct()),
      child: Scaffold(
          body: BlocBuilder<ProductBloc, ProductState>(
        buildWhen: (previous, current) {
          if (previous.allProducts != current.allProducts) {
            return true;
          }
          return false;
        },
        builder: (context, state) {
          return PageStateBuilder<List<Product>>(
              init: () => const SizedBox(),
              success: (data) => FeaturedProducts(product: data),
              loading: () => const AppLoading(),
              error: (exception, error) => FailedWidget(
                  onPressed: () =>
                      context.read<ProductBloc>().add(GetAllProduct()),
                  message: error),
              result: state.allProducts,
              empty: () => const SizedBox());
        },
      )),
    );
  }
}

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

class ProductShimmer extends StatelessWidget {
  const ProductShimmer({Key? key, this.dim}) : super(key: key);
  final Size? dim;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: dim?.height,
      width: dim?.width,
      margin: REdgeInsetsDirectional.only(end: 8),
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
          border: kBorderHalf, borderRadius: PBorderRadius.borderRadiusAllM1),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.max,
        children: [
          // Expanded(
          //   flex: 4,
          //   child: Stack(
          //     fit: StackFit.expand,
          //     clipBehavior: Clip.none,
          //     children: [
          Container(
            height: 100.h,
            width: double.infinity,
            color: Colors.white,
          ),
          // const _RenderCoponWidget(),
          // const _RenderNewWidget(),
          // const _RenderFAvouriteIcon()
          //     ],
          //   ),
          // ),
          // const CustomRatingWidget(),
          // const TextFlexibleBody(),
          // const Flexible(
          //     child: Padding(
          //       padding: EdgeInsets.symmetric(horizontal: 8),
          //       child: Text('***\$'),
          //     )),
        ],
      ),
    );
  }
}
