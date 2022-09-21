import 'package:aroundix_store/app/product/presentation/state/add_product_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

import '../../../../../common/const/const/form_group_key.dart';
import '../../../../../generated/l10n.dart';
import '../../../../user/presentation/widget/button_auth.dart';
import '../../../domain/entities/param/param_add_to_product.dart';
import '../../state/bloc/product/product_bloc.dart';

class ButtonAddProduct extends StatelessWidget {
  const ButtonAddProduct({
    Key? key,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    final s= S.of(context);
    return Consumer<AddProductProvider>(
      builder: (context,state,_) {
        return BlocBuilder<ProductBloc, ProductState>(
          builder: (context, stateP) {
            if (stateP.addProductStatus.isLoading()) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            return Center(
              child: ButtonAuth(
                  customText: s.add_product,
                  onTap: () {
                    if (state.checkValidAddProduct(context)) {
                      context.read<ProductBloc>().add(
                          AddProduct(
                              paramAddProduct: ParamAddProduct(
                                  productName: state.form
                                      .control(
                                      FormGroupKey.name)
                                      .value as String,
                                  addProductAttributes: state
                                      .addProductAttributes)));
                    }
                  }),
            );
          },
        );
      }
    );
  }
}
