import 'package:aroundix_core/core.dart';
import 'package:aroundix_design/design.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../../../../../generated/l10n.dart';
import '../../../../../injection/service_locator.dart';
import '../../../domain/entities/Product.dart';
import '../../state/bloc/product/product_bloc.dart';
import '../../state/select_piece_provider.dart';
import '../widget/detail_product/detail_product_widger.dart';

class DetailProductScreen extends StatelessWidget {
  const DetailProductScreen({
    Key? key,
    required this.id,
    required this.index,
  }) : super(key: key);
  static String path = 'detail-product';
  static String name = 'detail-product';
  final String id;
  final int index;

  static Page pageBuilder(BuildContext context, GoRouterState state) =>
      MaterialPage<void>(
        key: state.pageKey,
        child: MultiProvider(
          providers: [
            BlocProvider.value(
                value: si<ProductBloc>()
                  ..add(GetProductById(productId: (state.queryParams['id']!)))
            ),
          ],
          child: DetailProductScreen(
            id: (state.queryParams['id']!),
            index: int.parse(state.queryParams['index']!),
          ),
        ),
      );

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);
    return WillPopScope(
      onWillPop: () async {
        context.read<ProductBloc>()
            .add(PopFromDetailProduct());
        return true;
      },
      child: Scaffold(
        appBar: AppBar(
          title: BlocConsumer<ProductBloc, ProductState>(
            listener: (context, state) {},
            builder: (context, state) {
              return Text(
                  state.product.getDataWhenSuccess?.productName ?? s.loading);
            },
          ),
        ),
        body: BlocBuilder<ProductBloc, ProductState>(
          builder: (context, state) {
            return Builder(builder: (context) {
              return PageStateBuilder<Product>(
                init: () => const SizedBox(),
                success: (data) {
                  return ChangeNotifierProvider.value(
                    value: si<SelectPieceProvider>(param1: data),
                    child: DetailProductWidget(
                      product: data,
                      index: index,
                    ),
                  );
                },
                loading: () => const Center(
                  child: CircularProgressIndicator(),
                ),
                error: (exception, error) => FailedWidget(
                    onPressed: () => context
                        .read<ProductBloc>()
                        .add(GetProductById(productId: id)),
                    message: error),
                result: state.product,
                empty: () => const SizedBox(),
              );
            });
          },
        ),
      ),
    );
  }
}
