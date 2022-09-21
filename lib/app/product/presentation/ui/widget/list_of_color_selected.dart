import 'package:aroundix_design/design.dart';
import 'package:aroundix_store/app/product/presentation/state/add_product_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:collection/collection.dart';
import '../../../../../common/widget/chip_with_selction.dart';

import '../../../../../generated/l10n.dart';
import '../widget/title_bottom_sheet.dart';

class ListOfColorSelected extends StatelessWidget {
  const ListOfColorSelected({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final s=S.of(context);
    return Consumer<AddProductProvider>(builder: (context, state, _) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
           TitleText(text:s.select_color_to_add_images),
          Space.vS3,
          RSizedBox(
            height: 25,
            child: ListView(
              padding: PEdgeInsets.horizontal,
              scrollDirection: Axis.horizontal,
              children: List.of((state
                          .addProductAttributes[state.indexCurrentSizeSelected]
                          .colorAndImage ??
                      [])
                  .mapIndexed(
                    (index, e) => ChipWithSelection(
                      onTap: () {
                        state.selectColor(index);
                      },
                      isSelected: e.isSelected,
                      text: e.color.toString(),
                    ),
                  )
                  .toList()),
            ),
          ),
        ],
      );
    });
  }
}
