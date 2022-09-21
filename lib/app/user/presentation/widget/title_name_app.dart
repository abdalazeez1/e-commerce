import 'package:aroundix_design/design.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class TitleNameApp extends StatefulWidget {
  const TitleNameApp({Key? key, this.paddingButton}) : super(key: key);
  final Widget? paddingButton;

  @override
  State<TitleNameApp> createState() => _TitleNameAppState();

  static Shader linearGradient = const LinearGradient(
    colors: <Color>[Colors.black, Colors.black12],
  ).createShader(const Rect.fromLTWH(0.0, 0.0, 100, 30));
}

class _TitleNameAppState extends State<TitleNameApp>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> opacity;
  late final Animation<Offset> offset;

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );
    opacity = Tween<double>(begin: 0, end: 1).animate(
        CurvedAnimation(parent: _controller, curve: Curves.bounceInOut));
    offset = Tween<Offset>(begin: const Offset(100, 0), end: const Offset(0, 0))
        .animate(
            CurvedAnimation(parent: _controller, curve: Curves.bounceInOut));
    _controller.forward();

    _controller.addListener(() {
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      builder: (context, child) {
        return Transform.translate(
          offset: offset.value,
          child: child,
        );
      },
      animation: offset,
      child: FadeTransition(
        opacity: opacity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Space.vL3,
            Directionality(
              textDirection: TextDirection.ltr,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.baseline,
                mainAxisAlignment: MainAxisAlignment.center,
                textBaseline: TextBaseline.ideographic,
                children: [
                  Shimmer.fromColors(
                    baseColor: Colors.orange,
                    highlightColor: Colors.deepOrange,
                    child: GradientText('Aroundix',
                        style:
                            Theme.of(context).textTheme.displaySmall?.copyWith(
                          color: AppColors.orange,
                          shadows: [
                            Shadow(
                                color: Colors.orangeAccent.withOpacity(.4),
                                offset: const Offset(3, 1))
                          ],
                        ),
                        gradient: const LinearGradient(
                          colors: [
                            Colors.deepOrange,
                            Colors.orangeAccent,
                            Colors.deepOrangeAccent
                          ],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        )),
                  ),
                  GradientText('Store',
                      style: Theme.of(context)
                          .textTheme
                          .displaySmall
                          ?.copyWith(fontSize: 34.0.sp),
                      gradient: const LinearGradient(
                        colors: [Colors.white54, Colors.blueGrey,],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      )),
                ],
              ),
            ),
            widget.paddingButton ?? Space.vXL1,
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
