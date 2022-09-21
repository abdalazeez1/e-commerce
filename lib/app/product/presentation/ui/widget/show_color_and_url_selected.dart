import 'package:aroundix_store/app/product/presentation/state/add_product_provider.dart';
import 'package:aroundix_store/app/product/presentation/ui/widget/render_color_and_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ShowColorAndImagesSelected extends StatelessWidget {
  const ShowColorAndImagesSelected({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<AddProductProvider>(builder: (context, state, _) {
      var colorAndImage2 = state.addProductAttributes[state.indexCurrentSizeSelected]
          .colorAndImage?[state.indexCurrentColorSelected];

      if (state.addProductAttributes[state.indexCurrentSizeSelected].colorAndImage?.isNotEmpty??false) {
        return RenderColorAndImage(
          price: colorAndImage2?.price ?? 0,
          //todo remove ?
          nameColor: colorAndImage2?.color ?? '',
          images: colorAndImage2?.images ?? [],
        );
      } else {
        return const SizedBox();
      }
    });
  }
}
