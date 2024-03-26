import 'package:async_redux/async_redux.dart';
import '../../../../core/global.dart';
import '../../../../data/models/transaction.dart';
import '../../../../data/models/user.dart';
import '../../app_state.dart';

class FetchUserDataAction extends ReduxAction<AppState> {
  @override
  Future<AppState> reduce() async {
    User? user = await apiRepository.userProfile();
    if (user != null) {
      await _loadTransactions(user);
      return state.copyWith(currentUser: user);
    }
    return state;
  }

  _loadTransactions(User? user) async {
    List<Transaction> transactions = [];
    final response = await apiRepository.getUserTransactions();
    final transactionsJson = response.data["\$values"] as List<dynamic>;
    for (final transaction in transactionsJson) {
      transactions
          .add(Transaction.fromJson(transaction as Map<String, dynamic>));
    }
    user?.transactions = transactions;
  }
}
