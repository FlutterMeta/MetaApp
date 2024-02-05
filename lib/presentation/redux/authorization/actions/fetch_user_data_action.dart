import 'package:async_redux/async_redux.dart';

import '../../../../core/global.dart';
import '../../../../core/utils/api_client.dart';
import '../../../../data/models/transaction.dart';
import '../../../../data/models/user.dart';
import '../../../../data/repositories/api_repository_impl.dart';
import '../../app_state.dart';

import 'dart:html' as html;

class FetchUserDataAction extends ReduxAction<AppState> {
  @override
  Future<AppState> reduce() async {
    String key = html.window.localStorage["token"] ?? "";
    ApiClient apiClient = ApiClient(baseUrl: baseUrl, token: key);
    ApiRepositoryImpl apiRepository = ApiRepositoryImpl(apiClient: apiClient);
    User? user = await apiRepository.userProfile();
    if (user != null) {
      await _loadTransactions(user);
      return state.copyWith(currentUser: user);
    }
    return state;
  }

  _loadTransactions(User? user) async {
    List<Transaction> transactions = [];
    final response =
        await apiRepository.getTransactions(userId: user?.id ?? "userId");
    final transactionsJson = response.data["\$values"] as List<dynamic>;
    for (final transaction in transactionsJson) {
      transactions
          .add(Transaction.fromJson(transaction as Map<String, dynamic>));
    }
    user?.transactions = transactions;
  }
}
