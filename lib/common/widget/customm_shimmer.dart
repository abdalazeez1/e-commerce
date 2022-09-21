import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class CustomShimmer extends StatelessWidget {
  const CustomShimmer({
    Key? key,
    this.scrollDirection = Axis.vertical,
    required this.child,
  }) : super(key: key);
  final Widget child;
  final Axis scrollDirection;

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
        enabled: true,
        direction: scrollDirection == Axis.horizontal
            ? ShimmerDirection.ltr
            : ShimmerDirection.btt,
        baseColor: Theme.of(context).colorScheme.onBackground.withOpacity(.3),
        highlightColor: Colors.grey.shade100,
        child: child);
  }
}
