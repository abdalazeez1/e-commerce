import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_lorem/flutter_lorem.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';

import '../../../../../../generated/assets.dart';
import '../../../../../../generated/l10n.dart';
import 'package:intro_slider/intro_slider.dart';

import '../welcome/welcome_screen.dart';

class IntroScreen extends StatelessWidget {
  static const path = '/intro';
  static const name = 'intro';

  static Page pageBuilder(BuildContext context, GoRouterState state) {
    return MaterialPage<void>(
      key: state.pageKey,
      child: const IntroScreen(),
    );
  }

  const IntroScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: IntroScreenCustomConfig(),
    );
  }
}

class IntroScreenCustomConfig extends StatefulWidget {
  const IntroScreenCustomConfig({Key? key}) : super(key: key);

  @override
  IntroScreenCustomConfigState createState() => IntroScreenCustomConfigState();
}

// ------------------ Custom config ------------------
class IntroScreenCustomConfigState extends State<IntroScreenCustomConfig> {
  ButtonStyle myButtonStyle() {
    return ButtonStyle(
        shape: MaterialStateProperty.all<OutlinedBorder>(const StadiumBorder()),
        backgroundColor: MaterialStateProperty.all<Color>(
            Theme.of(context).colorScheme.primaryContainer),
        overlayColor: MaterialStateProperty.all<Color>(const Color(0x33FFA8B0)),
        padding: MaterialStateProperty.all(EdgeInsets.zero));
  }

  @override
  Widget build(BuildContext context) {
    return IntroSlider(
      slides: slides(context),
      renderSkipBtn: renderSkipBtn(),
      skipButtonStyle: myButtonStyle(),
      renderNextBtn: renderNextBtn(),
      onNextPress: onNextPress,
      nextButtonStyle: myButtonStyle(),
      renderDoneBtn: renderDoneBtn(),
      onDonePress: onDonePress,
      doneButtonStyle: myButtonStyle(),
      colorDot: const Color(0x33FFA8B0),
      colorActiveDot: Theme.of(context).colorScheme.primary,
      sizeDot: 13.0,
      hideStatusBar: false,
      backgroundColorAllSlides: Theme.of(context).scaffoldBackgroundColor,
      verticalScrollbarBehavior: ScrollbarBehavior.SHOW_ALWAYS,
    );
  }

  List<Slide> slides(BuildContext context) {
    final s = S.of(context);
    List<Slide> slides = [];
    final text = lorem(paragraphs: 4, words: 200);
    slides = [];
    slides.add(
      Slide(
        title: s.easy_to_buy_any_thing,
        maxLineTitle: 2,
        styleTitle: Theme.of(context).textTheme.titleSmall?.copyWith(
              fontSize: 30.0,
              fontWeight: FontWeight.bold,
              fontFamily: 'RobotoMono',
            ),
        description: text,
        styleDescription: Theme.of(context).textTheme.bodyMedium?.copyWith(
              fontSize: 20.0,
              fontStyle: FontStyle.italic,
              fontFamily: 'Raleway',
            ),
        marginDescription: const EdgeInsets.only(
          left: 20.0,
          right: 20.0,
          top: 20.0,
          bottom: 70.0,
        ),
        centerWidget: Lottie.asset(Assets.lottieCart),
        onCenterItemPress: () {},
      ),
    );
    slides.add(
      Slide(
        title: s.get_the_last_offer,
        maxLineTitle: 2,
        styleTitle: Theme.of(context).textTheme.titleSmall?.copyWith(
              fontSize: 30.0,
              fontWeight: FontWeight.bold,
              fontFamily: 'RobotoMono',
            ),
        description: text,
        styleDescription: Theme.of(context).textTheme.bodyMedium?.copyWith(
              fontSize: 20.0,
              fontStyle: FontStyle.italic,
              fontFamily: 'Raleway',
            ),
        marginDescription: const EdgeInsets.only(
          left: 20.0,
          right: 20.0,
          top: 20.0,
          bottom: 70.0,
        ),
        centerWidget: Lottie.asset(Assets.lottieSaleAndBuy),
        onCenterItemPress: () {},
      ),
    );
    slides.add(
      Slide(
        title: s.you_can_add_any_thing_to_cart_shopping_and_order_when_you_want,
        maxLineTitle: 2,
        styleTitle: Theme.of(context).textTheme.titleSmall?.copyWith(
              fontSize: 30.0,
              fontWeight: FontWeight.bold,
              fontFamily: 'RobotoMono',
            ),
        description: text,
        styleDescription: Theme.of(context).textTheme.bodyMedium?.copyWith(
              fontSize: 20.0,
              fontStyle: FontStyle.italic,
              fontFamily: 'Raleway',
            ),
        marginDescription: const EdgeInsets.only(
          left: 20.0,
          right: 20.0,
          top: 20.0,
          bottom: 70.0,
        ),
        centerWidget: Lottie.asset(Assets.lottieShoppingCart),
        onCenterItemPress: () {},
      ),
    );
    return slides;
  }

  void onDonePress() {
    context.pushNamed(WelcomeScreen.name);
  }

  void onNextPress() {
    log("onNextPress caught");
  }

  Widget renderNextBtn() {
    return Icon(
      Icons.navigate_next,
      color: const Color(0xffF3B4BA),
      size: 35.0.r,
    );
  }

  Widget renderDoneBtn() {
    return const Icon(
      Icons.done,
      color: Color(0xffF3B4BA),
    );
  }

  Widget renderSkipBtn() {
    return Text(S.of(context).skip);
  }
}
