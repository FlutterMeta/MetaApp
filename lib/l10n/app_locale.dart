import 'package:flutter/material.dart';
import 'package:meta_app/core/di/locator.dart';
import 'package:meta_app/data/datasources/local/shared_prefs.dart';
import 'package:locale_emoji_flutter/locale_emoji_flutter.dart' as le;

enum AppLocale {
  en,
  ru,
  uk;

  const AppLocale();

  Locale get locale {
    switch (this) {
      case AppLocale.en:
        return const Locale('en');
      case AppLocale.ru:
        return const Locale('ru');
      case AppLocale.uk:
        return const Locale('uk');
    }
  }

  static String? get currentLocaleFlag {
    final locale = locator<SharedPrefs>().getLocale() ?? AppLocale.en;
    switch (locale) {
      case AppLocale.en:
        return le.getFlagEmoji(languageCode: 'en');
      case AppLocale.ru:
        return le.getFlagEmoji(languageCode: 'ru');
      case AppLocale.uk:
        return le.getFlagEmoji(languageCode: 'uk');
    }
  }

  static String get enFlag => le.getFlagEmoji(languageCode: 'en') as String;
  static String get ruFlag => le.getFlagEmoji(languageCode: 'ru') as String;
  static String get ukFlag => le.getFlagEmoji(languageCode: 'uk') as String;
}
