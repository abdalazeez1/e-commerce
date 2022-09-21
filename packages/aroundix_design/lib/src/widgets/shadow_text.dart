import 'package:flutter/material.dart';

class ShadowText extends StatelessWidget {
  const ShadowText(this.data, {Key? key, this.colorShadow, required this.style,this.textAlign})
      : super(key: key);

  final String data;
  final TextStyle? style;
  final Color? colorShadow;
final TextAlign? textAlign;
  @override
  Widget build(BuildContext context) {
    return Text(
      data,
      style: style?.copyWith(
        shadows: <Shadow>[
           Shadow(
            offset: const Offset(-1.0, 1.5),
            blurRadius: 1.0,
            color:colorShadow?? Colors.grey,
          ),
          // const Shadow(
          //   offset: Offset(-1.0, -1.0),
          //   blurRadius: 2.0,
          //   color: Colors.grey,
          // ),
        ],
      ),
      textAlign:  textAlign,
    );
  }
}