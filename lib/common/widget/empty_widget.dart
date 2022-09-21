import 'package:aroundix_design/design.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';


class EmptyWidget extends StatelessWidget {
  const EmptyWidget({
    Key? key,
    required this.caption,
    required this.asset,
    this.title,
  }) : super(key: key);
  final String asset;
  final String? title;
  final String caption;

  @override
  Widget build(BuildContext context) {
    return RPadding(
      padding: PEdgeInsets.listView,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Lottie.asset(asset,
                alignment: Alignment.center, width: 150.r, height: 150.r),
          ),
          Column(
            children: [
              Text(title ?? 'No Data Add Yet !  ',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.titleSmall),
              Text(
                caption,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.caption,
              ),
              // TextButton.icon(
              //     onPressed: () {},
              //     style: TextButton.styleFrom(
              //         primary: Theme.of(context).colorScheme.onSurfaceVariant.withOpacity(.6)),
              //     icon: Icon(
              //       Icons.redo,
              //       size: 24.r,
              //       color: Theme.of(context).disabledColor,
              //     ),
              //     label: Text('Go to Home'))
            ],
          ),
        ],
      ),
    );
  }
}
