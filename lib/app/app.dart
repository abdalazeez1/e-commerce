import 'package:aroundix_design/design.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import '../common/provider/app_providers.dart';
import '../common/provider/local_provider.dart';
import '../common/provider/theme_provider.dart';
import '../generated/l10n.dart';
import '../router/router.dart';

void main() => runApp(const MaterialApp(home: MyApp()));

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AppMaterialProviders(
      builder: (context) {
        final appRouter = context.read<AppRouter>();
        final themeWatcher = context.watch<ThemeProvider>();
        final localeWatcher = context.watch<LocalizationProvider>();

        return ScreenUtilInit(
          builder: (context, _) => MaterialApp.router(
            routeInformationParser: appRouter.goRouter.routeInformationParser,
            routerDelegate: appRouter.goRouter.routerDelegate,
            debugShowCheckedModeBanner: false,
            title: 'Aroundix Store',
            themeMode: themeWatcher.themeMode,
            theme: lightTheme,
            darkTheme: darkTheme,
            localizationsDelegates: const [
              S.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            locale: localeWatcher.local,
            supportedLocales: S.delegate.supportedLocales,
            builder: (context, child) {
              return fontBuilder(context, child);
            },
          ),
        );
      },
    );
  }
}
