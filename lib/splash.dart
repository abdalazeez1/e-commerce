import 'package:aroundix_design/design.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';


class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  static const path = '/splash';
  static const name = 'splash_screen';

  static Page pageBuilder(BuildContext context, GoRouterState state) {
    return MaterialPage<void>(
      key: state.pageKey,
      child: const SplashScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: RSizedBox(
            width: 70.w,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.shopping_cart,
                  color: Theme.of(context).colorScheme.primary,
                  size: 70.w,
                ),
                FittedBox(
                  child: ShadowText(
                    'Aroundix Store',
                    textAlign: TextAlign.end,
                    style: Theme.of(context).textTheme.button?.copyWith(
                        color: Theme.of(context).colorScheme.primary,
                        fontSize: 16.sp),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
