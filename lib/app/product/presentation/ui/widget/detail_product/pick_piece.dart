import 'package:aroundix_design/design.dart';
import 'package:aroundix_store/app/product/presentation/ui/widget/detail_product/toggle_pick_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../state/select_piece_provider.dart';
import 'package:collection/collection.dart';

class PickPiece extends StatelessWidget {
  const PickPiece({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<SelectPieceProvider>(builder: (context, state, _) {
      return RSizedBox(
        height: .30.sh,
        child: Row(
          children: [
            Expanded(
                flex: 8,
                child: AnimatedSwitcher(
                  duration: const Duration(seconds: 1),
                  child: CustomImage(
                    path: state.getImageSelected,
                    fit: BoxFit.contain,
                  ),
                )),
            Expanded(
              flex: 2,
              child: Scrollbar(
                child: SingleChildScrollView(
                  child: ToggleButtons(
                    direction: Axis.vertical,
                    borderWidth: 10,
                    selectedBorderColor: Theme.of(context).colorScheme.primary,
                    renderBorder: false,
                    isSelected: state.isSelectedImage,
                    onPressed: (index) => context
                        .read<SelectPieceProvider>()
                        .onSelectImage(index),
                    fillColor: Theme.of(context).scaffoldBackgroundColor,
                    children:state.getListImages
                        .mapIndexed(
                          (i, e) => TogglePickImage(
                              url: e.colorImage,
                              isSelected: e.isSelected),
                        )
                        .toList(),
                  ),
                ),
              ),
            )
          ],
        ),
      );
    });
  }
}
