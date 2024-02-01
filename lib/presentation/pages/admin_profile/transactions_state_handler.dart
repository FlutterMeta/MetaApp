import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

import '../../../core/global.dart';
import '../../../data/models/transaction.dart';

class TransactionsStateHandler {
  static TransactionsStateHandler get instance => _singleton;
  static final TransactionsStateHandler _singleton =
      TransactionsStateHandler._internal();
  TransactionsStateHandler._internal();

  // If controller value changes, the Transactions page will rebuild
  static final ValueNotifier<int> _controller = ValueNotifier(0);
  static ValueNotifier<int> get controller => _controller;

  List<Transaction> get transactions => _transactions;
  void addtransaction(Transaction transaction) =>
      _transactions.add(transaction);
  void removetransaction(Transaction transaction) =>
      _transactions.removeWhere((element) => element.id == transaction.id);
  void edittransaction(Transaction transaction) {
    final index =
        _transactions.indexWhere((element) => element.id == transaction.id);
    _transactions[index] = transaction;
  }

  void init() async {
    _transactions.clear();
    TransactionsStateHandler.controller.value--;
    preloadtransactions();
  }

  final List<Transaction> _transactions = [];
}

void preloadtransactions() async {
  Response response = await apiRepository.getTransactions();
  if (response.statusCode == 200) {
    final data = response.data["\$values"] as List<dynamic>;

    for (final transaction in data) {
      TransactionsStateHandler.instance.addtransaction(
        Transaction.fromJson(transaction as Map<String, dynamic>),
      );
      TransactionsStateHandler.controller.value++;
    }
  }
}
