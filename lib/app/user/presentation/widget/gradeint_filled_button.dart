import 'package:aroundix_design/design.dart';
import 'package:flutter/material.dart';

class GradientFilledButton extends StatelessWidget {
  const GradientFilledButton({
    Key? key,
    required this.buttonWidthFactorBig,
    required this.onTap,
    this.gradient,
    this.useFittedBox = false,
    required this.text,
  }) : super(key: key);
  final bool useFittedBox;

  final double buttonWidthFactorBig;
  final VoidCallback? onTap;
  final String text;
  final Gradient? gradient;

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      widthFactor: buttonWidthFactorBig,
      child: FilledButton(
        style: OutlinedButton.styleFrom(padding: EdgeInsets.zero, elevation: 4),
        clipBehavior: Clip.antiAlias,
        onPressed: onTap,
        child: Container(
            width: double.infinity,
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              gradient: gradient ??
                  const LinearGradient(
                    colors: [
                      Colors.deepOrange,
                      Colors.orangeAccent,
                      Colors.deepOrangeAccent
                    ],
                  ),
            ),
            constraints: BoxConstraints(minWidth: 0.0, maxWidth: 1.sw),
            child: useFittedBox
                ? FittedBox(
                    child: Text(text, textAlign: TextAlign.center),
                  )
                : Text(text, textAlign: TextAlign.center)),
      ),
    );
  }
}
