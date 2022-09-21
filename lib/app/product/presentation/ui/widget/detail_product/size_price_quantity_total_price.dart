import 'package:aroundix_design/design.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:collection/collection.dart';
import '../../../../../../generated/l10n.dart';
import '../../../state/select_piece_provider.dart';

class SizePriceQuantityTotalPrice extends StatelessWidget {
  const SizePriceQuantityTotalPrice({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<SelectPieceProvider>(builder: (context, state, _) {
      return RPadding(
        padding: REdgeInsets.symmetric(horizontal: horizontalAppPadding),
        child: RSizedBox(
          height: .18.sh,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (state.isSelectedSize.isNotEmpty) const _SizeWidget(),

              ],
            ),
          ),
        ),
      );
    });
  }
}



class _SizeWidget extends StatelessWidget {
  const _SizeWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var s = S.of(context);
    return Row(
      children: [
        Text(
          s.size,
          style: Theme.of(context).textTheme.caption,
        ),
        SingleChildScrollView(
          child: ToggleButtons(
              renderBorder: false,
              fillColor: Theme.of(context).scaffoldBackgroundColor,
              onPressed: (index) =>
                  context.read<SelectPieceProvider>().onSelectSize(index),
              isSelected: context.read<SelectPieceProvider>().isSelectedSize,
              children: (context
                  .read<SelectPieceProvider>()
                  .product.productOptions?.productSizes??[])
                  .mapIndexed(
                (index,e) {
                   bool isSelected = context
                     .watch<SelectPieceProvider>()
                     .isSelectedSize[index];
                 return Container(
                   height: 25.r,
                   width: 25.r,
                   decoration: BoxDecoration(
                     border: Border.all(
                         width: 1,
                         color: isSelected
                             ? Theme.of(context).colorScheme.inversePrimary
                             : AppColors.grey),
                   ),
                   child: FittedBox(
                     child: Text(
                       e.productSize,
                       style: Theme.of(context).textTheme.button?.copyWith(
                           color: isSelected
                               ? Theme.of(context).colorScheme.inversePrimary
                               : AppColors.grey),
                     ),
                   ),
                 );
                },
              ).toList()),
        )
      ],
    );
  }
}
