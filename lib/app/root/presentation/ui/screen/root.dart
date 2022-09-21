import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_zoom_drawer/config.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:go_router/go_router.dart';

import '../../../../../common/provider/local_provider.dart';
import '../../../root_manger/root_provider_widget.dart';
import '../widget/body.dart';
import '../widget/meny_screen.dart';

final ZoomDrawerController z = ZoomDrawerController();

class RootScreen extends StatelessWidget {
  const RootScreen({Key? key}) : super(key: key);
  static const path = '/root';
  static const name = 'root_screen';

  static Page pageBuilder(BuildContext context, GoRouterState state) {
    return MaterialPage<void>(
      key: state.pageKey,

      child: const RootProvidersWidget(
        root: RootScreen(

        ),

      ),
    );
  }

  static GlobalKey<MenuScreenState> stateMenuScreen =
  GlobalKey<MenuScreenState>();

  @override
  Widget build(BuildContext context) {
    final localeWatcher = context.watch<LocalizationProvider>();
    return ZoomDrawer(
      controller: z,
      borderRadius: 24,
      isRtl: localeWatcher.local==const Locale('ar')?true:false,//todo
      style: DrawerStyle.defaultStyle,
      showShadow: true,
      openCurve: Curves.fastOutSlowIn,
      slideWidth: MediaQuery
          .of(context)
          .size
          .width * 0.65,
      duration: const Duration(milliseconds: 500),
      angle: 0.0,
      mainScreen: const Body(),
      menuScreen: MenuScreen(key: stateMenuScreen),
      menuBackgroundColor: Colors.orangeAccent.withOpacity(.8),
    );
  }


}

