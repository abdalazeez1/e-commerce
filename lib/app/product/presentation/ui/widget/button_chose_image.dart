import 'package:flutter/material.dart';

class ButtonChoseImage extends StatelessWidget {
  const ButtonChoseImage(
      {Key? key, required this.iconData, required this.onTap})
      : super(key: key);
  final IconData iconData;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Center(child: Icon(iconData)),
      ),
    );
  }
}
