import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:weather_app/core/di/injector.dart';
import 'package:weather_app/core/storage/shared_preferences_manager.dart';

class LocaleProvider with ChangeNotifier {
  Locale _locale = Locale('en'); // Default locale is English

  Locale get locale => _locale;

  void loadLocale() {
    final String langCode = getIt<SharedPreferencesManager>()
            .getString(SharedPreferencesManager.language) ??
        'en';
    log('LangCode: $langCode');
    _locale = Locale(langCode);
    notifyListeners();
  }

  void setLocale(Locale locale) {
    _locale = locale;
    notifyListeners(); // Notify listeners about the change
  }
}
