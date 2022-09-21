import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

const kArabicFontFamily = 'NotoKufiArabic';
const kEnglishFontFamily = 'NotoSans';

const _package = 'design';
final TextTheme textTheme = TextTheme(
  displayLarge: TextStyle(
      fontSize: 64.0.sp, fontWeight: FontWeight.w100, package: _package), //57
  displayMedium: TextStyle(
      fontSize: 52.0.sp, fontWeight: FontWeight.w400, package: _package), //45
  displaySmall: TextStyle(
      fontSize: 44.0.sp, fontWeight: FontWeight.w400, package: _package), //36
  headlineLarge: TextStyle(
      fontSize: 40.0.sp, fontWeight: FontWeight.w400, package: _package),
  headlineMedium: TextStyle(
      fontSize: 34.0.sp, fontWeight: FontWeight.w400, package: _package),
  headlineSmall: TextStyle(
      fontSize: 24.0.sp, fontWeight: FontWeight.w400, package: _package),
  titleLarge: TextStyle(
      fontSize: 22.0.sp, fontWeight: FontWeight.w500, package: _package),
  titleMedium: TextStyle(
      fontSize: 16.0.sp, fontWeight: FontWeight.w400, package: _package),
  titleSmall: TextStyle(
      fontSize: 14.0.sp, fontWeight: FontWeight.w500, package: _package),
  bodyLarge: TextStyle(
      fontSize: 16.0.sp, fontWeight: FontWeight.w500, package: _package),
  bodyMedium: TextStyle(
      fontSize: 14.0.sp, fontWeight: FontWeight.w400, package: _package),
  bodySmall: TextStyle(
      fontSize: 12.0.sp, fontWeight: FontWeight.w400, package: _package),
  labelLarge: TextStyle(
      fontSize: 14.0.sp, fontWeight: FontWeight.w500, package: _package),
  labelMedium: TextStyle(
      fontSize: 12.0.sp, fontWeight: FontWeight.w400, package: _package),
  labelSmall: TextStyle(
      fontSize: 10.0.sp, fontWeight: FontWeight.w400, package: _package),
);

Theme fontBuilder(BuildContext context, Widget? child) {
  final languageCode = Localizations.localeOf(context).languageCode;
  final themeData = Theme.of(context);
  return Theme(
    data: themeData.copyWith(
      textTheme: themeData.textTheme.apply(
        fontFamily:
            languageCode == 'en' ? kEnglishFontFamily : kArabicFontFamily,
      ),
    ),
    child: child!,
  );
}
