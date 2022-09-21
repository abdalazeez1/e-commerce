import 'package:aroundix_design/design.dart';
import 'package:aroundix_store/app/product/presentation/state/add_product_provider.dart';
import 'package:aroundix_store/app/product/presentation/ui/widget/title_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../../common/const/const/form_group_key.dart';
import '../../../../../generated/l10n.dart';

class EnterColorAndPriceWidget extends StatelessWidget {
  const EnterColorAndPriceWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);

    return Consumer<AddProductProvider>(builder: (context, state, _) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TitleText(text:
              '${s.add_color_and_image_to} ${state.addProductAttributes.firstWhere((element) => element.isSelected).size}'),
          Space.vS3,
          RPadding(
            padding: PEdgeInsets.horizontal,
            child: Column(
              children: [
                CustomStyleReactiveTextFiled(
                  hintText: s.enter_color,
                  prefixIcon: Icons.donut_large,
                  formControlName: FormGroupKey.color,
                  validationMessages: {
                    ValidationMessage.required: (error) => s.required,
                  },
                ),
                Space.vS3,
                CustomStyleReactiveTextFiled(
                  hintText: s.enter_price,
                  prefixIcon: Icons.price_change_outlined,
                  formControlName: FormGroupKey.price,
                  keyboardType: TextInputType.number,
                  validationMessages: {
                    ValidationMessage.required: (error) => s.required,
                    ValidationMessage.number: (error) => s.enter_number_only,
                  },
                ),
                Space.vM1,
                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            primary: Theme.of(context).colorScheme.onPrimary),
                        onPressed: () {

                          state.addColorWithPrice(context);

                        },
                        child: Text(
                          s.add_color_with_price,
                          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                              color: Theme.of(context).colorScheme.primary),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      );
    });
  }
}
