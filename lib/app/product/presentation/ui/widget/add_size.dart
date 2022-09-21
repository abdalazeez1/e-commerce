import 'package:aroundix_design/design.dart';
import 'package:aroundix_store/app/product/presentation/state/add_product_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:collection/collection.dart';
import '../../../../../common/const/const/form_group_key.dart';
import '../../../../../common/widget/chip_with_selction.dart';
import '../../../../../generated/l10n.dart';
import '../../../domain/entities/add_product_attributes.dart';
import '../widget/switch_widget_address.dart';
import '../widget/title_bottom_sheet.dart';

class AddSizeWidget extends StatelessWidget {
  const AddSizeWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);

    return Consumer<AddProductProvider>(builder: (context, state, _) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TitleText(text: s.size),
          SwitchWidgetAddress(
            index: 0,
            onTapDone: () {
              var enterText = state.form.control(FormGroupKey.size).value;
              if (enterText != null && enterText != '') {
                final int index = state.addProductAttributes
                    .indexWhere((element) => element.isSelected);
                if (index >= 0) {
                  state.addProductAttributes[index] =
                      state.addProductAttributes[index].copyWithIsSelected();
                }
                state.addProductAttributes = (state.addProductAttributes
                  ..add(AddProductAttributes(
                    size: enterText,
                    isSelected: true,
                  )));
                state.form.control(FormGroupKey.size).reset();
              }
            },
            secondChild: List.of(state.addProductAttributes
                .mapIndexed(
                  (index, e) => ChipWithSelection(
                    onTap: () {
                      state.selectSize(index);
                    },
                    isSelected: e.isSelected,
                    text: e.size,
                  ),
                )
                .toList()),
            firstChild:  CustomStyleReactiveTextFiled(
              hintText: s.enter_size,
              prefixIcon: Icons.donut_large,
              formControlName: FormGroupKey.size,
              validationMessages: const {},
            ),
          ),

        ],
      );
    });
  }
}
