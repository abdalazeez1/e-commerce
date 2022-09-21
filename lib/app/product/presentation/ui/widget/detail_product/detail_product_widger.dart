import 'package:aroundix_design/design.dart';
import 'package:aroundix_store/app/product/presentation/state/select_piece_provider.dart';
import 'package:aroundix_store/app/product/presentation/ui/widget/detail_product/pick_piece.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../../../common/widget/chip_with_selction.dart';
import '../../../../../../generated/l10n.dart';
import '../../../../domain/entities/Product.dart';
import 'package:collection/collection.dart';

class DetailProductWidget extends StatelessWidget {
  const DetailProductWidget({
    Key? key,
    required this.index,
    required this.product,
  }) : super(key: key);
  final int index;
  final Product product;

  @override
  Widget build(BuildContext context) {
  final s=S.of(context);
    return Stack(
      fit: StackFit.expand,
      children: [
        ListView(

          children: [
            const PickPiece(),

            Consumer<SelectPieceProvider>(builder: (context, state, _) {
              return RPadding(
                padding: PEdgeInsets.horizontal,
                child: Text(
                  '${s.price}${state.getPriceByVariant()}',
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium
                      ?.copyWith(color: Theme.of(context).colorScheme.primary),
                ),
              );
            }),Space.vS2,
            Consumer<SelectPieceProvider>(builder: (context, state, _) {
              return RSizedBox(
                height: 25,
                child: ListView(
                    padding: PEdgeInsets.horizontal,
                    scrollDirection: Axis.horizontal,
                    children: state.getSize
                        .mapIndexed(
                          (index, e) => ChipWithSelection(
                            onTap: () {
                              state.onSelectSize(index);
                            },
                            isSelected: e.isSelected,
                            text: e.productSize,
                          ),
                        )
                        .toList()),
              );
            }),
            Space.vS2,
            Consumer<SelectPieceProvider>(builder: (context, state, _) {
              return RSizedBox(
                height: 25,
                child: ListView(
                    padding: PEdgeInsets.horizontal,
                    scrollDirection: Axis.horizontal,
                    children: state.getColor
                        .mapIndexed(
                          (index, e) => ChipWithSelection(
                            onTap: () {
                              state.onSelectColor(index);
                            },
                            isSelected: e.isSelected,
                            text: e.colorName,
                          ),
                        )
                        .toList()),
              );
            }),

            //     const Divider(),
            //     const Divider(),
            //     const SizePriceQuantityTotalPrice(),
            //     const Divider(),
            //     const CustomSelect(),
            //     const Divider(),
            //     const Divider(),
            //     // const DescriptionWidget(),
            //     const Divider(),
            //     const DetailsProduct(),
            //     Space.vM4,
            //
          ],
        ),
        // const GroupButtonBuyAndAddToCart()
      ],
    );
  }
}

// class CustomSelect extends StatelessWidget {
//   const CustomSelect({
//     Key? key,
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     var s = S.of(context);
//
//     return Consumer<SelectPieceProvider>(
//         builder: (context, SelectPieceProvider state, _) {
//           final List<String> val = state.product.productOptions?.productSizes??[];
//
//           return RPadding(
//             padding: REdgeInsets.symmetric(horizontal: horizontalAppPadding),
//             child: RSizedBox(
//               child: SingleChildScrollView(
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     for (int row = 0; row < val.length; row++)
//                       RSizedBox(
//                         child: Row(
//                           children: [
//                             Text('${val} :',
//                                 style: Theme
//                                     .of(context)
//                                     .textTheme
//                                     .caption),
//                             SingleChildScrollView(
//                               child: ToggleButtons(
//                                   renderBorder: false,
//                                   fillColor:
//                                   Theme
//                                       .of(context)
//                                       .scaffoldBackgroundColor,
//                                   onPressed: (index) =>
//                                       context
//                                           .read<SelectPieceProvider>()
//                                           .onSelectColor(index),
//                                   isSelected:
//                                   val[row].value.map((e) => false).toList(),
//                                   children: ((val[row].value)
//                                       .map((e) => false)
//                                       .toList()).mapIndexed(
//                                         (column, e) {
//                                       bool isSelected = context
//                                           .watch<SelectPieceProvider>()
//                                           .selectCustom[row] ==
//                                           val[row].value[column];
//                                       return Stack(
//                                         alignment: Alignment.center,
//                                         children: [
//                                           ChipWithSelection(
//                                               text: val[row].value[column]
//                                                   .value,
//                                               isSelected: isSelected,
//                                               onTap: () =>
//                                                   context
//                                                       .read<
//                                                       SelectPieceProvider>()
//                                                       .onSelectCustom(
//                                                       row, column)),
//                                         ],
//                                       );
//                                     },
//                                   ).toList()),
//                             )
//                           ],
//                         ),
//                       )
//                   ],
//                 ),
//               ),
//             ),
//           );
//         });
//   }
// }
