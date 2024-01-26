import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:meta_app/l10n/app_locale.dart';
import 'package:meta_app/data/models/user.dart'; // Assuming you have a User model

part 'app_state.freezed.dart';

@freezed
class AppState with _$AppState {
  const factory AppState({
    required ThemeMode themeMode,
    required AppLocale appLocale,
    User? currentUser,
  }) = _AppState;

  factory AppState.initial() => const AppState(
        themeMode: ThemeMode.light,
        appLocale: AppLocale.en,
        currentUser: null,
      );
}
