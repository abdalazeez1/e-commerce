import 'package:aroundix_design/design.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:go_router/go_router.dart';

import '../../../../../common/const/const/duration_animation.dart';
import '../../../../../common/provider/local_provider.dart';
import '../../../../../common/widget/tedt_flexible_body.dart';
import '../../../../../../generated/l10n.dart';
import '../widget/language_widget.dart';

class ChangeLanguageScreen extends StatefulWidget {
  const ChangeLanguageScreen({Key? key}) : super(key: key);
  static const path = 'change-language';
  static const name = 'change-language';

  static Page pageBuilder(BuildContext context, GoRouterState state) {
    return MaterialPage<void>(
      key: state.pageKey,
      child: const ChangeLanguageScreen(),
    );
  }

  @override
  State<ChangeLanguageScreen> createState() => _ChangeLanguageScreenState();
}

class _ChangeLanguageScreenState extends State<ChangeLanguageScreen> {
  @override
  Widget build(BuildContext context) {
    final s = S.of(context);
    final List<Locale> supportLang = S.delegate.supportedLocales;
    return Scaffold(
      appBar: AppBar(
        title: Text('${s.language}'
            // '${LocalizationProvider.of(context).local}'
            ''),
      ),
      body: AnimationLimiter(
        child: ListView.builder(
          key: UniqueKey(),
          itemCount: supportLang.length,
          itemBuilder: (context, index) => AnimationConfiguration.staggeredList(
            position: index,
            duration: ConfigAnimation.durationMedium,
            delay: ConfigAnimation.delayShort,
            child: SlideAnimation(
              key: ValueKey(index),
              horizontalOffset: ConfigAnimation.horizontalOffsetLarge,
              child: FadeInAnimation(
                child: LanguageWidget(
                  locale: supportLang[index],
                ),
              ),
            ),
          ),
          padding: PEdgeInsets.listView,
        ),
      ),
    );
  }
}
