import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../app/product/presentation/ui/screen/add_product.dart';
import '../app/root/presentation/ui/screen/change_language_screen.dart';
import 'routes.dart';

class AppRouter {
  AppRouter({
    required this.context,
  }) {
    goRouter = GoRouter(
      debugLogDiagnostics: true,
      routes: _routes,
      initialLocation: SplashScreen.path,
      redirect: (state) => _rootRedirect(context, state),
      refreshListenable:
          GoRouterRefreshStream(context.read<AppMangerBloc>().stream),
    );
  }

  final BuildContext context;

  late final GoRouter goRouter;

  late final List<GoRoute> _routes = [
    GoRoute(
        path: SplashScreen.path,
        name: SplashScreen.name,
        pageBuilder: SplashScreen.pageBuilder),
    GoRoute(
        path: RootScreen.path,
        name: RootScreen.name,
        pageBuilder: RootScreen.pageBuilder,
        routes: [
          GoRoute(
              path: AddProductScreen.path,
              name: AddProductScreen.name,
              pageBuilder: AddProductScreen.pageBuilder),
          GoRoute(
              path: DetailProductScreen.path,
              name: DetailProductScreen.name,
              pageBuilder: DetailProductScreen.pageBuilder),
          GoRoute(
              path: ChangeLanguageScreen.path,
              name: ChangeLanguageScreen.name,
              pageBuilder: ChangeLanguageScreen.pageBuilder),
        ]),
    GoRoute(
        path: IntroScreen.path,
        name: IntroScreen.name,
        pageBuilder: IntroScreen.pageBuilder,
        routes: [
          GoRoute(
            path: WelcomeScreen.path,
            name: WelcomeScreen.name,
            pageBuilder: WelcomeScreen.pageBuilder,
            routes: [
              GoRoute(
                path: LoginScreen.path,
                name: LoginScreen.name,
                pageBuilder: LoginScreen.pageBuilder,
              ),
              GoRoute(
                path: SignUpScreen.path,
                name: SignUpScreen.name,
                pageBuilder: SignUpScreen.pageBuilder,
              ),
            ],
          ),
        ]),
  ];

  _rootRedirect(BuildContext context, GoRouterState state) {
    final appState = context.read<AppMangerBloc>().state;
    final goingToIntro = !(state.location.contains(IntroScreen.path));
    if (goingToIntro && appState.state == AppState.unAuthenticated) {
      return IntroScreen.path;
    }
    final goingToHome = !(state.location.contains(RootScreen.path));

    if (goingToHome && appState.state == AppState.authenticated) {
      return RootScreen.path;
    }

    return null;
  }

  static AppRouter of(BuildContext context) {
    return Provider.of<AppRouter>(context, listen: false);
  }
}
