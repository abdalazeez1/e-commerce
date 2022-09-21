import 'package:aroundix_design/design.dart';
import 'package:aroundix_store/app/product/presentation/state/add_product_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'icon_end_list.dart';

class SwitchWidgetAddress extends StatelessWidget {
  const SwitchWidgetAddress(
      {Key? key,
      required this.secondChild,
      required this.firstChild,
      required this.index,
      this.onTapDone})
      : super(key: key);
  final int index;
  final List<Widget> secondChild;
  final Widget firstChild;
  final VoidCallback? onTapDone;

  @override
  Widget build(BuildContext context) {
    return Consumer<AddProductProvider>(builder: (context, state, _) {
      return AnimatedSize(
        duration: const Duration(milliseconds: 300),
        child: RSizedBox(
          height: state.enterCustomDate[index] ? 50 : 25,
          child: AnimatedCrossFade(
            firstChild: ReactiveTextFieldWithDoneButton(
                firstChild: firstChild,
                padding: PEdgeInsets.horizontal,
                onTapDone: () {
                  state.enterCustomDateWithIndex(false, index);
                  if (onTapDone != null) {
                    onTapDone!();
                  }
                }),
            secondChild: RSizedBox(
              height: 25,
              child: ListView(
                padding: PEdgeInsets.horizontal,
                scrollDirection: Axis.horizontal,
                children: secondChild
                  ..add(IconEndList(
                    onTap: () {
                      state.enterCustomDateWithIndex(true, index);
                    },
                  )),
              ),
            ),
            crossFadeState: state.enterCustomDate[index]
                ? CrossFadeState.showFirst
                : CrossFadeState.showSecond,
            duration: const Duration(milliseconds: 300),
            alignment: Alignment.centerRight,
            sizeCurve: Curves.easeInBack,
            firstCurve: Curves.bounceInOut,
          ),
        ),
      );
    });
  }
}

class ReactiveTextFieldWithDoneButton extends StatelessWidget {
  const ReactiveTextFieldWithDoneButton({
    Key? key,
    this.padding,
    required this.firstChild,
    required this.onTapDone,
  }) : super(key: key);

  final Widget firstChild;
  final VoidCallback? onTapDone;
  final EdgeInsets? padding;

  @override
  Widget build(BuildContext context) {
    return RPadding(
      padding: padding ?? EdgeInsets.zero,
      child: Row(
        children: [
          Expanded(child: firstChild),
          Space.hS3,
          GestureDetector(onTap: onTapDone, child: const Icon(Icons.done))
        ],
      ),
    );
  }
}
