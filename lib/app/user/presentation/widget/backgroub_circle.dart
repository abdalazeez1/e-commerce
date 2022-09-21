import 'package:aroundix_design/design.dart';
import 'package:flutter/material.dart';

class BackGroundCircle extends StatefulWidget {
  const BackGroundCircle({
    Key? key,
  }) : super(key: key);

  @override
  State<BackGroundCircle> createState() => _BackGroundCircleState();
}

class _BackGroundCircleState extends State<BackGroundCircle>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    _controller = AnimationController(
        vsync: this,
        duration: const Duration(seconds: 1),
        lowerBound: -0.2,
        upperBound: .1);

    _controller.forward();

    _controller.addListener(() {
      setState(() {});
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      left: .1.sw,
      top: _controller.value.sw,
      child: CustomPaint(
        foregroundPainter: _PaintT(),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}

class _PaintT extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()..color = Colors.orange.withOpacity(.2);
    Paint paint1 = Paint()..color = Colors.orange.withOpacity(0.4);
    canvas.drawCircle(Offset(size.width / 2, -.1.sh), .6.sw, paint);
    canvas.drawCircle(Offset(size.width, 0), .3.sw, paint1);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
