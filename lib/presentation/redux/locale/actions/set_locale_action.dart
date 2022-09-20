import 'package:async_redux/async_redux.dart';
import 'package:meta_app/core/di/locator.dart';
import 'package:meta_app/data/datasources/local/shared_prefs.dart';
import 'package:meta_app/l10n/app_locale.dart';
import 'package:meta_app/presentation/redux/app_state.dart';

class SetLocaleAction extends ReduxAction<AppState> {
  final AppLocale locale;

  SetLocaleAction(this.locale);

  @override
  Future<AppState> reduce() async {
    await locator<SharedPrefs>().setLocale(locale);
    return state.copyWith(appLocale: locale);
  }
}
