import 'package:aroundix_design/design.dart';
import 'package:flutter/material.dart';

///constant
final SliverGridDelegateWithFixedCrossAxisCount kConfigurationGrid =
    SliverGridDelegateWithFixedCrossAxisCount(
  crossAxisCount: 2,
  mainAxisSpacing: 10.h,
  crossAxisSpacing: 20.h,
  childAspectRatio: 6 / 8,

  ///cross /main
);
final SliverGridDelegateWithFixedCrossAxisCount kConfigurationGrid3 =
    SliverGridDelegateWithFixedCrossAxisCount(
  crossAxisCount: 3,
  mainAxisSpacing: 10.h,
  crossAxisSpacing: 20.h,
  childAspectRatio: 1,

  ///cross /main
);
const double horizontalAppPadding = 24;
const kIconSize = 22.0;
const buttonBorderRadius = 12.0;
const String fontFamily = "Segoe";
const designSize = Size(414, 1046);
Border kBorderHalf = Border.all(color: Colors.grey.shade300, width: .5);
Border kBorderSelected = Border.all(color: Colors.red.shade300, width: .5);
Border kBorder =
    Border.all(color: Colors.redAccent.shade200.withOpacity(.1), width: 1);

///Style
EdgeInsets buttonRPadding =
    EdgeInsets.symmetric(horizontal: 12.r, vertical: 12.r);

BorderRadius borderRadiusCircular = BorderRadius.circular(10.r);
Radius radiusCircular = Radius.circular(12.r);

final ButtonStyle elevatedButtonStyle = ElevatedButton.styleFrom(
  primary: AppColors.primary,
  elevation: 1,
  padding: buttonRPadding.r,
  shape: RoundedRectangleBorder(borderRadius: borderRadiusCircular),
);

final ButtonStyle textButtonStyle = TextButton.styleFrom(
    primary: AppColors.grey, padding: buttonRPadding.r,
    textStyle: const TextStyle(color: AppColors.grey),
    shape: RoundedRectangleBorder(
      borderRadius: borderRadiusCircular,
    ));
final InputDecorationTheme inputDecorationThemeLight = InputDecorationTheme(
  fillColor: Colors.white,
  focusedBorder: OutlineInputBorder(
    borderSide: const BorderSide(color: AppColors.primary),
    borderRadius: borderRadiusCircular,
  ),
  errorStyle: TextStyle(color: Colors.red, height: 1.sp),
  contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 15),
  border: OutlineInputBorder(borderRadius: borderRadiusCircular),
);
final InputDecorationTheme inputDecorationThemeDark = InputDecorationTheme(
  fillColor: Colors.grey[700],
  focusedBorder: OutlineInputBorder(
    borderSide: const BorderSide(color: AppColors.primary),
    borderRadius: borderRadiusCircular,
  ),
  errorStyle: TextStyle(color: Colors.red, height: 1.sp),
  contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 15),
  border: OutlineInputBorder(borderRadius: borderRadiusCircular),
);

final ButtonStyle outlineButtonStyle = OutlinedButton.styleFrom(
  primary: AppColors.primary, padding: buttonRPadding.r,
  side: const BorderSide(color: AppColors.primary),
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(buttonBorderRadius.r),
  ),
);

final dialogTheme = DialogTheme(
  shape: RoundedRectangleBorder(
    borderRadius: borderRadiusCircular,
  ),
);

final cardTheme = CardTheme(
    margin: EdgeInsets.zero,
    elevation: 5,
    shape: RoundedRectangleBorder(
      borderRadius: borderRadiusCircular,
    ));

final iconTheme = IconThemeData(size: kIconSize.r, color: Colors.black);

InputDecoration dynamicInputDecorationTheme({
  required ThemeData themeData,
  required String labelText,
  required IconData icon,
  String? hintText,
}) =>
    InputDecoration(
        labelText: labelText,
        hintText: hintText,
        prefixIcon: Icon(icon),
        errorStyle:
            themeData.textTheme.caption!.copyWith(color: themeData.errorColor),
        contentPadding: EdgeInsets.symmetric(horizontal: 10.r),
        focusedErrorBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.transparent),
            borderRadius: borderRadiusCircular),
        errorBorder: InputBorder.none,
        focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.transparent),
            borderRadius: borderRadiusCircular),
        enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.transparent),
            borderRadius: borderRadiusCircular),
        border: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.transparent),
            borderRadius: borderRadiusCircular),
        prefixIconConstraints: BoxConstraints(minWidth: 40.w));
