import 'package:aroundix_design/design.dart';
import 'package:aroundix_store/app/product/presentation/state/add_product_provider.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

import '../screen/add_product.dart';
import 'button_chose_image.dart';

class PickImage extends StatelessWidget {
  const PickImage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<AddProductProvider>(
      builder: (context,state,_) {
        return Center(
          child: FractionallySizedBox(
            widthFactor: .7,
            child: Container(
              padding: REdgeInsets.symmetric(
                  vertical: LayoutConstrains.s2),
              decoration: BoxDecoration(
                  border: Border.all(
                      color: Theme.of(context)
                          .colorScheme
                          .primary),
                  borderRadius:
                  PBorderRadius.borderRadiusAllM1),
              child: IntrinsicHeight(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ButtonChoseImage(
                      onTap: () async {
                        state.addImageToColor(
                            await state.picker.pickImage(
                                source: ImageSource.camera));
                      },
                      iconData: Icons.camera_alt,
                    ),
                    VerticalDivider(
                        color: Theme.of(context)
                            .colorScheme
                            .primary
                            .withOpacity(.7)),
                    ButtonChoseImage(
                        onTap: () async {
                          state.addImageToColor(
                              await state.picker.pickImage(
                                  source:
                                  ImageSource.gallery));
                        },
                        iconData: Icons.image),
                  ],
                ),
              ),
            ),
          ),
        );
      }
    );
  }
}
