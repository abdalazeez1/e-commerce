
import 'package:aroundix_design/design.dart';
import 'package:flutter/material.dart';



class CustomButtonDetailProduct extends StatelessWidget {
  const CustomButtonDetailProduct({
    Key? key,
    required this.text,
    this.onTap,
  }) : super(key: key);
  final String text;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: RPadding(
          padding: REdgeInsets.all(8),
          child:
          FilledButton(onPressed: onTap, child: FittedBox(child: Text(text))),
        ));
  }
}
