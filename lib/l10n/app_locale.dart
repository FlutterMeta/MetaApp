import 'package:flutter/material.dart';
import 'package:locale_emoji_flutter/locale_emoji_flutter.dart' as le;
import 'package:meta_app/core/utils/extensions/build_context_ext.dart';

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

  String? get localeFlag {
    switch (this) {
      case AppLocale.en:
        return le.getFlagEmoji(languageCode: 'en');
      case AppLocale.ru:
        return le.getFlagEmoji(languageCode: 'ru');
      case AppLocale.uk:
        return le.getFlagEmoji(languageCode: 'uk');
    }
  }

  String toTitle(BuildContext context) {
    switch (this) {
      case AppLocale.en:
        return context.localizations.english;
      case AppLocale.ru:
        return context.localizations.russian;
      case AppLocale.uk:
        return context.localizations.ukrainian;
    }
  }
}
