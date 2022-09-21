import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import '../../injection/service_locator.dart';
import '../../router/router.dart';
import '../app_manger/app_manger_bloc.dart';
import 'local_provider.dart';
import 'theme_provider.dart';

class AppMaterialProviders extends StatelessWidget {
  final WidgetBuilder builder;

  const AppMaterialProviders({
    Key? key,
    required this.builder,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppMangerBloc(
        doBeforeOpen: ()=>_doBeforeOpen(context),

      )..add(AppMangerStarted()),
      child: Builder(builder: (context) {
        return MultiProvider(
          providers: [
            Provider<AppRouter>(
              create: (context) => AppRouter(context: context),
            ),
            ChangeNotifierProvider(
              create: (context) => ThemeProvider(
                si(),
              ),
            ),
            ChangeNotifierProvider(
              create: (context) => LocalizationProvider(
                si(),
              ),
            ),

          ],
          builder: (context, _) => builder(context),
        );
      }),
    );
  }

  FutureOr<void> _doBeforeOpen(context) async {
    // timeago.setLocaleMessages('ar', timeago.ArMessages());
    // timeago.setLocaleMessages('ar', timeago.ArShortMessages());
    // SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge,overlays: [SystemUiOverlay.bottom,]);
    // await SystemChrome.setPreferredOrientations(
    //   [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown],
    // );
    // await Firebase.initializeApp(
    //     options: DefaultFirebaseOptions.currentPlatform);
    await inject(context);
    // si<DeepLinking>().handleInitialUri();
    // si<DeepLinking>().handleInitialUri();
  }
}
