import 'dart:io';

import 'package:aroundix_design/design.dart';
import 'package:aroundix_store/app/product/presentation/state/add_product_provider.dart';
import 'package:aroundix_store/app/product/presentation/ui/widget/title_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../generated/l10n.dart';

class RenderColorAndImage extends StatelessWidget {
  const RenderColorAndImage({
    Key? key,
    required this.price,
    required this.nameColor,
    required this.images,
  }) : super(key: key);
  final String nameColor;
  final List<File> images;
  final int price;

  @override
  Widget build(BuildContext context) {
    final s=S.of(context);
    return Consumer<AddProductProvider>(builder: (context, state, _) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TitleText(text: "$nameColor  $price"),
          if (state
                  .addProductAttributes[state.indexCurrentSizeSelected]
                  .colorAndImage?[state.indexCurrentColorSelected]
                  .images
                  .isNotEmpty ??
              false)
            RSizedBox(
              height: 50,
              child: ListView(
                  padding: PEdgeInsets.horizontal,
                  scrollDirection: Axis.horizontal,
                  children: images
                      .map((e) => Padding(
                            padding: const EdgeInsetsDirectional.only(end: 8),
                            child: RSizedBox(
                                height: 30,
                                width: 50,
                                child: Image.file(
                                  e,
                                  fit: BoxFit.cover,
                                )),
                          ))
                      .toList()),
            )
          else
            RPadding(
              padding: PEdgeInsets.horizontal,
              child: Text(
                s.no_images_added_yet,
                style: Theme.of(context).textTheme.caption,
              ),
            ),
        ],
      );
    });
  }
}
