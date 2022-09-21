import 'package:flutter/material.dart';

class ConfigAnimation {
  ConfigAnimation._();
//todo refactor class too anthor name 100 150 200 => ....
  static const Duration delayShortV = Duration(milliseconds: 50);
  static const Duration delayShort = Duration(milliseconds: 100);
  static const Duration delayMedium = Duration(milliseconds: 200);
  static const Duration delayLong = Duration(milliseconds: 300);
  static const Duration durationShort = Duration(milliseconds: 300);
  static const Duration durationMedium = Duration(milliseconds: 400);
  static const Duration durationLong = Duration(milliseconds: 600);
  static const double horizontalOffsetSmall=50.0;
  static const double horizontalOffsetMedium=100.0;
  static const double horizontalOffsetLarge=150.0;
  static const double horizontalOffsetLargeX=200.0;
  static const Curve curves=Curves.bounceInOut;
}
