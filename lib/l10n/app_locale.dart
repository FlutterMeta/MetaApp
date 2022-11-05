import 'package:flutter/material.dart';
import 'package:locale_emoji_flutter/locale_emoji_flutter.dart' as le;
import 'package:meta_app/core/utils/extensions/build_context_ext.dart';

enum AppLocale {
  en;

  const AppLocale();

  Locale get locale {
    switch (this) {
      case AppLocale.en:
        return const Locale('en');
    }
  }

  String? get localeFlag {
    switch (this) {
      case AppLocale.en:
        return le.getFlagEmoji(languageCode: 'en');
    }
  }

  String toTitle(BuildContext context) {
    switch (this) {
      case AppLocale.en:
        return context.localizations.english;
    }
  }
}
