import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

abstract class LayoutConstrains {
  LayoutConstrains._();

  static const s1 = 2.0;
  static const s2 = 4.0;
  static const s3 = 8.0;
  static const m1 = 12.0;
  static const m2 = 16.0;
  static const m3 = 20.0;
  static const m4 = 24.0;
  static const l1 = 32.0;
  static const l2 = 40.0;
  static const l3 = 48.0;
  static const xl1 = 64.0;
  static const xl2 = 72.0;
  static const xl3 = 80.0;
  static const xxl1 = 96.0;
  static const xxl2 = 128;
  static const xxl3 = 160;
}

abstract class Space {
  Space._();

  static const vS1 = RSizedBox.vertical(LayoutConstrains.s1);
  static const vS2 = RSizedBox.vertical(LayoutConstrains.s2);
  static const vS3 = RSizedBox.vertical(LayoutConstrains.s3);
  static const vM1 = RSizedBox.vertical(LayoutConstrains.m1);
  static const vM2 = RSizedBox.vertical(LayoutConstrains.m2);
  static const vM3 = RSizedBox.vertical(LayoutConstrains.m3);
  static const vM4 = RSizedBox.vertical(LayoutConstrains.m4);
  static const vL1 = RSizedBox.vertical(LayoutConstrains.l1);
  static const vL2 = RSizedBox.vertical(LayoutConstrains.l2);
  static const vL3 = RSizedBox.vertical(LayoutConstrains.l3);
  static const vXL1 = RSizedBox.vertical(LayoutConstrains.xl1);
  static const vXL2 = RSizedBox.vertical(LayoutConstrains.xl2);
  static const vXL3 = RSizedBox.vertical(LayoutConstrains.xl3);

  ///////////////////////////////////////////////////////////
  static const hS1 = RSizedBox.horizontal(LayoutConstrains.s1);
  static const hS2 = RSizedBox.horizontal(LayoutConstrains.s2);
  static const hS3 = RSizedBox.horizontal(LayoutConstrains.s3);
  static const hM1 = RSizedBox.horizontal(LayoutConstrains.m1);
  static const hM2 = RSizedBox.horizontal(LayoutConstrains.m2);
  static const hM3 = RSizedBox.horizontal(LayoutConstrains.m3);
  static const hM4 = RSizedBox.horizontal(LayoutConstrains.m4);
  static const hL1 = RSizedBox.horizontal(LayoutConstrains.l1);
  static const hL2 = RSizedBox.horizontal(LayoutConstrains.l2);
  static const hL3 = RSizedBox.horizontal(LayoutConstrains.l3);
  static const hXL1 = RSizedBox.horizontal(LayoutConstrains.xl1);
  static const hXL2 = RSizedBox.horizontal(LayoutConstrains.xl2);
  static const hXL3 = RSizedBox.horizontal(LayoutConstrains.xl3);
}

abstract class PRadius {
  PRadius._();

  static const button = 12.0;
  static const floatingButton = 20.0;
  static const container = 12.0;
  static const texFiled = 12.0;
  static const chip = 12.0;
  static const checkBox = 6.0;
}

abstract class PEdgeInsets {
  PEdgeInsets._();

  static final listView = REdgeInsets.all(
    LayoutConstrains.m3,
  );
  static final bottomFloatBuffer =
      REdgeInsets.only(bottom: LayoutConstrains.l3);
  static final horizontal =
      REdgeInsets.symmetric(horizontal: LayoutConstrains.m3);
  static final horizontalSmall =
      REdgeInsets.symmetric(horizontal: LayoutConstrains.s2);
   static final horizontalBetweenItemList =
   REdgeInsets.only(right: LayoutConstrains.s3);
  static final vertical =
      REdgeInsets.symmetric(vertical: LayoutConstrains.m3, horizontal: 0);
  static final dHorizontal =
      REdgeInsets.symmetric(horizontal: LayoutConstrains.l2);
}

abstract class PBorderRadius {
  PBorderRadius._();

  static final BorderRadius borderRadiusAllS1 =
      BorderRadius.circular(LayoutConstrains.s1);
  static final BorderRadius borderRadiusAllS2 =
      BorderRadius.circular(LayoutConstrains.s2);
  static final BorderRadius borderRadiusAllS3 =
      BorderRadius.circular(LayoutConstrains.s3);
  static final BorderRadius borderRadiusAllM1 =
      BorderRadius.circular(LayoutConstrains.m1);
  static final BorderRadius borderRadiusAllM2 =
      BorderRadius.circular(LayoutConstrains.m2);
  static final BorderRadius borderRadiusAllM3 =
      BorderRadius.circular(LayoutConstrains.m3);
  static final BorderRadius borderRadiusAllM4 =
      BorderRadius.circular(LayoutConstrains.m4);
  static final BorderRadius borderRadiusAllL1 =
      BorderRadius.circular(LayoutConstrains.l1);
  static final BorderRadius borderRadiusAllL2 =
      BorderRadius.circular(LayoutConstrains.l2);
  static final BorderRadius borderRadiusAllL3 =
      BorderRadius.circular(LayoutConstrains.l3);
  static final BorderRadius borderRadiusAllXl1 =
      BorderRadius.circular(LayoutConstrains.xl1);
  static final BorderRadius borderRadiusAllXl2 =
      BorderRadius.circular(LayoutConstrains.xl2);
  static final BorderRadius borderRadiusAllXl3 =
      BorderRadius.circular(LayoutConstrains.xl3);
}
