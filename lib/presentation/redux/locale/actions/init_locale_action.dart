import 'package:async_redux/async_redux.dart';
import 'package:meta_app/core/di/locator.dart';
import 'package:meta_app/data/datasources/local/shared_prefs.dart';
import 'package:meta_app/presentation/redux/app_state.dart';

class InitLocaleAction extends ReduxAction<AppState> {
  @override
  AppState reduce() {
    final locale = locator<SharedPrefs>().getLocale();
    return state.copyWith(appLocale: locale);
  }
}
