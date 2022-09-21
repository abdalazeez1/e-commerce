import 'package:flutter/material.dart';

///   GradientText(
///   'Hello Flutter',
///   style: const TextStyle(fontSize: 40),
///   gradient: LinearGradient(colors: [
///     Colors.blue.shade400,
///     Colors.blue.shade900,
///   ]),
/// ),
class GradientText extends StatelessWidget {
  const GradientText(
    this.text, {
    Key? key,
    required this.gradient,
    this.style,
  }) : super(key: key);

  final String text;
  final TextStyle? style;
  final Gradient gradient;

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      blendMode: BlendMode.srcIn,
      shaderCallback: (bounds) => gradient.createShader(
        Rect.fromLTWH(0, 0, bounds.width, bounds.height),
      ),
      child: Text(
        text,
        style: style,
      ),
    );
  }
}
