import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:meta_app/core/di/locator.dart';
import 'package:meta_app/data/datasources/local/shared_prefs.dart';
import 'package:meta_app/presentation/redux/app_state.dart';

class InitThemeAction extends ReduxAction<AppState> {
  @override
  AppState reduce() {
    final themeMode = locator<SharedPrefs>().getThemeMode() ?? ThemeMode.light;
    return state.copyWith(themeMode: themeMode);
  }
}
