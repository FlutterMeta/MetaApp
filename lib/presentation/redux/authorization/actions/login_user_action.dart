import 'package:async_redux/async_redux.dart';
import '../../../../data/models/user.dart';
import '../../app_state.dart';

class LoginUserAction extends ReduxAction<AppState> {
  final User user;

  LoginUserAction(this.user);

  @override
  AppState reduce() {
    return state.copyWith(currentUser: user);
  }
}
