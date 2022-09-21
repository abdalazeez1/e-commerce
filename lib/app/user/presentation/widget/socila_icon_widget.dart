import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class SocialIconWidget extends StatelessWidget {
  const SocialIconWidget(
      {Key? key, this.color, this.onTap, required this.asset})
      : super(key: key);
  final Function()? onTap;
  final Color? color;
  final String asset;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: onTap,
        child:SvgPicture.asset(asset, width: 30.r, height: 30.r) ,
      ),
    );
  }
}
