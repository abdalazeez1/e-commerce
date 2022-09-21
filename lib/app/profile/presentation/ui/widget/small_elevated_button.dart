import 'package:aroundix_design/design.dart';
import 'package:flutter/material.dart';

class SmallElevatedButton extends StatelessWidget {
  const SmallElevatedButton(
      {Key? key, required this.icon, required this.text, required this.onTap})
      : super(key: key);
  final IconData icon;

  final String text;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return RSizedBox(
      height: 20.h,
      child: Row(
        children: [
          const Spacer(flex: 1),
          Expanded(
            flex: 3,
            child: FittedBox(
              child: ElevatedButton.icon(
                icon: Icon(icon),
                label: Text(text),
                onPressed: onTap,
              ),
            ),
          ),
          const Spacer(flex: 1),
        ],
      ),
    );
  }
}
