import 'package:aroundix_design/design.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:go_router/go_router.dart';

import '../../../../../common/const/const/duration_animation.dart';
import '../../../../../common/provider/theme_provider.dart';
import '../../../../../generated/l10n.dart';
import '../screen/change_language_screen.dart';
import 'item_drawer.dart';

class MenuScreen extends StatefulWidget {
  const MenuScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<MenuScreen> createState() => MenuScreenState();
}

class MenuScreenState extends State<MenuScreen> {
  EdgeInsets paddingSymmetric = REdgeInsets.symmetric(horizontal: 4.0);

  void changeState() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    var s = S.of(context);
    return Scaffold(
        backgroundColor: Colors.transparent,
        body: RPadding(
          padding: PEdgeInsets.listView,
          child: Builder(builder: (context) {
            return Column(
              children: AnimationConfiguration.toStaggeredList(
                duration: ConfigAnimation.durationShort,
                delay: ConfigAnimation.delayShort,
                childAnimationBuilder: (widget) => SlideAnimation(
                  key: ValueKey(widget.hashCode),
                  horizontalOffset: ConfigAnimation.horizontalOffsetSmall,
                  curve: ConfigAnimation.curves,
                  child: FadeInAnimation(
                    key: ValueKey(widget.hashCode),
                    child: widget,
                  ),
                ),
                children: [
                  Space.vL1,
                  Space.vL1,
                  ItemDrawer(
                    text: s.switch_mode,
                    child: _buildThemeButton(
                        context, Theme.of(context).colorScheme.onBackground),
                    onTap: () =>
                        _onChangeTheme(context, Theme.of(context).brightness),
                    color: Theme.of(context).colorScheme.onBackground,
                  ),
                  ItemDrawer(
                      icon: const Icon(Icons.language),
                      color: Theme.of(context).colorScheme.onBackground,
                      text: s.language,
                      onTap: () =>
                          context.pushNamed(ChangeLanguageScreen.name)),
                ],
              ),
            );
          }),
        ));
  }
}


_buildThemeButton(BuildContext context, Color color) {
  final brightness = Theme.of(context).brightness;
  return GestureDetector(

      // iconSize: 24.r,
      onTap: () => _onChangeTheme(context, brightness),
      child: AnimatedSwitcher(
        duration: const Duration(milliseconds: 200),
        transitionBuilder: (child, animation) {
          child = ScaleTransition(
            scale: animation,
            child: child,
          );
          return RotationTransition(
            turns: animation,
            child: child,
          );
        },
        child: Icon(
          brightness == Brightness.light
              ? Icons.nightlight_round_outlined
              : Icons.wb_sunny_outlined,
          key: Key(brightness.index.toString()),
          color: color,
        ),
      ));
}

void _onChangeTheme(BuildContext context, Brightness brightness) {
  ThemeProvider.of(context).toggleTheme();
}
