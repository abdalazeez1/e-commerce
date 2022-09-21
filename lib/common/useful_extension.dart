import 'package:flutter/material.dart';

extension ColorExetnsionList on List<String>{
  List<Color> get toColors{
    return map((e) => e.toColor).toList();
  }

}

extension ColorExtension on String{
  Color get  toColor{
    return Color(int.parse(substring(1,7),radix: 16)+0XFF000000);
}
}