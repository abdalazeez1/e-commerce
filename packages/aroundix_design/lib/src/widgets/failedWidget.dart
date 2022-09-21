
import 'package:aroundix_design/design.dart';

import 'package:flutter/material.dart';

class FailedWidget extends StatelessWidget {
  const FailedWidget(
      {Key? key,
      this.isSliver = false,
      required this.onPressed,
      required this.message,
      this.padding})
      : super(key: key);
  final Function() onPressed;
  final String? message;
  final bool isSliver;
  final EdgeInsets? padding;

  @override
  Widget build(BuildContext context) {
    final widget = Center(
      child: RPadding(
        padding: padding ?? PEdgeInsets.horizontal,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(message ?? '',
                style: Theme.of(context).textTheme.caption,
                textAlign: TextAlign.center),
            TextButton.icon(
                onPressed: onPressed,
                icon: const Icon(Icons.refresh),
                label: const Text('اعادة المحاولة ')),
          ],
        ),
      ),
    );
    return isSliver
        ? SliverToBoxAdapter(
            child: widget,
          )
        : widget;
  }
}
