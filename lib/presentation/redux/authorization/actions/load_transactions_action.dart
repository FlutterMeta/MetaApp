import 'package:async_redux/async_redux.dart';

import '../../../../core/global.dart';
import '../../../../data/models/transaction.dart';

import '../../app_state.dart';

class LoadTransactionsAction extends ReduxAction<AppState> {
  final String userId;

  LoadTransactionsAction(this.userId);

  @override
  Future<AppState> reduce() async {
    final user = state.currentUser;
    List<Transaction> transactions = [];
    final response = await apiRepository.getUserTransactions();
    final transactionsJson = response.data["\$values"] as List<dynamic>;
    for (final transaction in transactionsJson) {
      transactions
          .add(Transaction.fromJson(transaction as Map<String, dynamic>));
    }

    return state.copyWith(
      currentUser: user?.copyWith(transactions: transactions) ?? user,
    );
  }
}
