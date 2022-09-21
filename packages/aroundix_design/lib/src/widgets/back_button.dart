import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppBackButton extends StatelessWidget {
  AppBackButton(
      {Key? key,
      this.colors,
      this.colorIcon,
      this.iconData,
      this.onTap,
      double? dim,
      this.border,
      this.isRight = true,
      this.isOutLined = false})
      : dim = dim?.r ?? 30.r,
        super(key: key);
  final List<Color>? colors;
  final Color? colorIcon;
  final Function()? onTap;
  final bool isOutLined;
  final Border? border;
  final bool isRight;
  final double dim;
  final IconData? iconData;
  @override
  Widget build(BuildContext context) {
    return isOutLined
        ? _OutLineBackButton(
            colorIcon: colorIcon,
            border: border,
            dim: dim,
            onTap: onTap,
            isRight: isRight,
          )
        : Transform.rotate(
            angle: isRight ? 0 : pi,
            child: Center(
              child: GestureDetector(
                onTap: onTap ??
                    () {
                      Navigator.of(context).pop();
                    },
                child: Container(
                  height: dim,
                  width: dim,
                  decoration: BoxDecoration(
                      border: border,
                      shape: BoxShape.circle,
                      color: colors?.length == 1 ? colors![0] : null,
                      gradient: colors?.length != 1
                          ? LinearGradient(
                              colors: colors ??
                                  const [
                                    Color(0xffAA78FF),
                                    Color(0xff985CFF),
                                  ],
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter)
                          : null),
                  child: Center(
                    child: Icon(
                      iconData ?? Icons.arrow_back_rounded,
                      color: colorIcon ?? Colors.white,
                      size: dim / 2,
                    ),
                  ),
                ),
              ),
            ),
          );
  }
}

class _OutLineBackButton extends StatelessWidget {
  const _OutLineBackButton(
      {Key? key,
      this.colorIcon,
      this.onTap,
      this.border,
      this.iconData,
      this.isRight = true,
      required this.dim})
      : super(key: key);
  final Color? colorIcon;
  final Border? border;
  final bool isRight;
  final Function()? onTap;
  final double dim;
  final IconData? iconData;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap ??
          () {
            Navigator.of(context).pop();
          },
      child: Transform.rotate(
        angle: isRight ? 0 : pi,
        child: Container(
          height: dim,
          width: dim,
          decoration: BoxDecoration(shape: BoxShape.circle, border: border),
          child: Icon(
            iconData ?? Icons.arrow_back_rounded,
            color: colorIcon ?? Colors.white,
          ),
        ),
      ),
    );
  }
}
