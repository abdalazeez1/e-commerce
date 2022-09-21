import 'package:flutter/material.dart';

abstract class KeyStorage {
  KeyStorage._();

  static const String cart = 'cart';
  static const String user = 'user';
  static const String token = 'token';
  static const String listCart = 'list-cart';
  static const String favourite = 'favourite';
  static const String address = 'address';
}

extension FlexStringExtensions on String {
  Color get toColor {
    if (this == '') return const Color(0xFF000000);
    String hexColor = replaceAll('#', '');
    hexColor = hexColor.replaceAll('0x', '');
    hexColor = hexColor.padLeft(6, '0');
    hexColor = hexColor.padLeft(8, 'F');
    final int length = hexColor.length;
    return Color(int.tryParse('0x${hexColor.substring(length - 8, length)}') ??
        0xFF000000);
  }

  String get capitalize {
    return (length > 1) ? this[0].toUpperCase() + substring(1) : toUpperCase();
  }

  String get dotTail {
    return split('.').last;
  }
}
