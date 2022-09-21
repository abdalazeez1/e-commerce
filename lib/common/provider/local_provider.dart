import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../storage.dart';

const _localeModeKey = '__Local_key__';

class LocalizationProvider extends ChangeNotifier {
  LocalizationProvider(this.storageService) {
    _load();
  }

  final IStorageService storageService;

  String? _localeString;

  _setLocale(String locale) {
    _localeString = locale;
    notifyListeners();
  }

  void _load() {
    _setLocale(storageService.getString(_localeModeKey) ?? 'en');
  }

  Locale get local {
    if (_localeString == 'ar') {
      return const Locale('ar');
    }
    if(_localeString == 'tr') {
      return const Locale('tr');
    }

    return const Locale('en');
  }

  void changeLocale(String newLocale) {


    _setLocale(newLocale);
    storageService.setString(_localeModeKey, newLocale);
  }

  static LocalizationProvider of(BuildContext context) {
    return context.read<LocalizationProvider>();
  }
}

enum SupportLocal { tr, ar, en }
