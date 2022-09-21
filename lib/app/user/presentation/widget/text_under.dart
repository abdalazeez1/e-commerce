import 'package:aroundix_design/design.dart';
import 'package:flutter/material.dart';

class TextUnder extends StatelessWidget {
  const TextUnder({
    Key? key,
    this.style,
    this.onTap,
    this.icon,
    this.color,
    this.colorShadow,
    this.padding,
    this.align = const AlignmentDirectional(-0.9, -1.0),
    required this.text,
  }) : super(key: key);
  final String text;
  final Function()? onTap;
  final AlignmentGeometry align;
  final TextStyle? style;
  final Icon? icon;
  final Color? color;
  final Color? colorShadow;
  final EdgeInsets? padding;

  @override
  Widget build(BuildContext context) {
    // var colorShadow2 = colorShadow ?? style?.color?.withOpacity(.1);
    final child = Text(
      text,
      style: style ??
          Theme.of(context).textTheme.caption?.copyWith(
              color: color ?? AppColors.pink,
              fontSize: 10.sp),
      // colorShadow: colorShadow2,
    );

    // var styleButton = TextButton.styleFrom(
    //     padding: EdgeInsets.zero, shadowColor: colorShadow2);
    return RPadding(
      padding: padding ?? REdgeInsets.only(top: 2),
      child: GestureDetector(
        onTap: onTap,
        child: Align(
          alignment: align,
          child: icon != null
              ? Row(
                  children: [ icon!, Space.hS3,child],
                )
              : child,
        ),
      ),
    );
  }
}
