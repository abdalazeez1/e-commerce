
import 'package:aroundix_core/core.dart';
import 'package:aroundix_design/design.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../../injection/service_locator.dart';
import '../../../domain/entities/Product.dart';
import '../../state/bloc/product/product_bloc.dart';
import '../widget/featured_producrs.dart';

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





