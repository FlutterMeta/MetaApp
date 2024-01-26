import 'package:async_redux/async_redux.dart';

import '../../app_state.dart';

class LogoutUserAction extends ReduxAction<AppState> {
  @override
  AppState reduce() {
    return state.copyWith(currentUser: null);
  }
}
