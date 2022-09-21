import 'package:aroundix_design/design.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';

import '../../../../../../generated/assets.dart';
import '../../../../../../generated/l10n.dart';
import '../../../widget/gradeint_filled_button.dart';
import '../../../widget/text_under.dart';
import '../login/login_screen.dart';
import '../sign_up/sign_up_screen.dart';

class WelcomeScreen extends StatelessWidget {
  static const path = 'welcome';
  static const name = 'welcome';

  static Page pageBuilder(BuildContext context, GoRouterState state) {
    return MaterialPage<void>(
      key: state.pageKey,
      child: const WelcomeScreen(),
    );
  }

  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const buttonWidthFactor = 0.55;
    final s = S.of(context);

    const buttonWidthFactorSmall = 0.45;
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Spacer(
              flex: 3,
            ),
            Lottie.asset(Assets.lottieWelcomeScreen),
            const Spacer(
              flex: 1,
            ),
            Column(
              children: [
                Space.vS3,
                GradientFilledButton(
                    buttonWidthFactorBig: buttonWidthFactor,
                    onTap: () => _onSignUpPressed(context),
                    text: s.sign_up),
                Space.vM3,
                TextUnder(
                  text: s.or_do_you_have_an_account,
                  align: Alignment.center,
                  style: Theme.of(context).textTheme.caption?.copyWith(
                      fontSize: 8.sp,
                      color: Theme.of(context).colorScheme.onBackground),
                ),
                FractionallySizedBox(
                  widthFactor: buttonWidthFactorSmall,
                  child: OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      elevation: 4,
                    ),
                    onPressed: () => _onLoginPressed(context),
                    child: Text(s.login),
                  ),
                ),
              ],
            ),
            const Spacer(flex: 4),
          ],
        ),
      ),
    );
  }

  void _onLoginPressed(BuildContext context) {
    context.goNamed(LoginScreen.name);
  }

  void _onSignUpPressed(BuildContext context) {
    context.goNamed(SignUpScreen.name);
  }
}
