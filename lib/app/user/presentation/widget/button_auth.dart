import 'package:flutter/material.dart';


import '../../../../generated/l10n.dart';
import 'gradeint_filled_button.dart';

class ButtonAuth extends StatefulWidget {
  const ButtonAuth(
      {Key? key,
      this.isBig = true,
      this.useFittedBox = false,
      this.customText,
      this.inLogin = true,
      this.onTap})
      : super(key: key);
  final bool isBig;
  final VoidCallback? onTap;
  final bool inLogin;
  final String? customText;
  final bool useFittedBox;

  @override
  State<ButtonAuth> createState() => _ButtonAuthState();
}

class _ButtonAuthState extends State<ButtonAuth>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> opacity;

  @override
  void initState() {
    _controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));
    opacity = Tween<double>(begin: 0, end: 1).animate(
        CurvedAnimation(parent: _controller, curve: Curves.bounceInOut));

    _controller.forward();

    _controller.addListener(() {
      setState(() {});
    });
    super.initState();
  }
@override
  void dispose() {
_controller.dispose();
super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    final s = S.of(context);

    var buttonWidthFactor = .5;
    var buttonWidthFactorBig = .7;
    return widget.isBig
        ? FadeTransition(
            opacity: opacity,
            child: GradientFilledButton(
                buttonWidthFactorBig: buttonWidthFactorBig,
                onTap: widget.onTap,
                useFittedBox: widget.useFittedBox,
                text: widget.customText != null
                    ? widget.customText!
                    : widget.inLogin
                        ? s.login
                        : s.sign_up),
          )
        : FractionallySizedBox(
            widthFactor: buttonWidthFactor,
            child: OutlinedButton(
              style: OutlinedButton.styleFrom(padding: EdgeInsets.zero),
              onPressed: widget.onTap,
              child: Text(widget.customText != null
                  ? widget.customText!
                  :widget.inLogin ? s.sign_up : s.login),
            ),
          );
  }
}
