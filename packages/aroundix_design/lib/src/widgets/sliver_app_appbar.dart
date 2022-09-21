import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'back_button.dart';

class SliverAppAppbar extends StatelessWidget {
  const SliverAppAppbar(
      {Key? key, required this.title, required this.actionAsset})
      : super(key: key);
  final String title;

  ///svg
  final String actionAsset;
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      centerTitle: true,
      title: Text(title),
      leading: AppBackButton(),
      actions: [
        SvgPicture.asset(
          actionAsset,
        )
      ],
    );
  }
}

class AppAppBar extends StatelessWidget implements PreferredSizeWidget {
  const AppAppBar({Key? key, required this.title, required this.actionAsset})
      : super(key: key);
  final String title;

  ///svg
  final String actionAsset;
  @override
  AppBar build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      title: Text(title),
      leading: AppBackButton(),
      actions: [
        SvgPicture.asset(
          actionAsset,
        )
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
