import 'package:aroundix_bootstrap/p_bootstrap.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'app/app.dart';
import 'common/storage.dart';
import 'injection/service_locator.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final SharedPreferences sharedPreferences =
      await SharedPreferences.getInstance();
  si.registerSingleton<IStorageService>(StorageService(sharedPreferences));

  await bootstrap(
    () => const MyApp(),
  );
}
