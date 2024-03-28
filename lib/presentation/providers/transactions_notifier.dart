import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:meta_app/core/global.dart';
import 'package:meta_app/data/models/result.dart';
import 'package:meta_app/data/models/transaction.dart';

class TransactionsNotifier extends ChangeNotifier {
  List<Transaction> _transactions = [];
  List<Transaction> get transactions => _transactions;

  Future<Result> loadTransactions() async {
    try {
      Response response = await apiRepository.getTransactions();
      if (response.statusCode == 200) {
        final data = response.data["\$values"] as List<dynamic>;

        _transactions.clear();
        for (final transactionData in data) {
          Transaction transaction =
              Transaction.fromJson(transactionData as Map<String, dynamic>);
          _transactions.add(transaction);
        }
        // Sort transactions by date
        _transactions.sort((a, b) => a.date.compareTo(b.date));
        notifyListeners();
        return Result.success();
      } else {
        return Result.failure(message: response.data["title"]?.toString());
      }
    } catch (e) {
      debugPrint(e.toString());
      return Result.failure(message: e.toString());
    }
  }

  Future<Result> addTransaction(Transaction transaction) async {
    try {
      Response response =
          await apiRepository.createTransaction(transaction.toJson());
      if (response.statusCode == 200) {
        _transactions.add(transaction);
        notifyListeners();
        return Result.success();
      } else {
        return Result.failure(message: response.data["title"]?.toString());
      }
    } catch (e) {
      debugPrint(e.toString());
      return Result.failure(message: e.toString());
    }
  }

  Future<Result> approveTransaction(Transaction transaction) async {
    try {
      Response response =
          await apiRepository.approveTransaction(transaction.id);
      if (response.statusCode == 200) {
        int index = _transactions.indexWhere((t) => t.id == transaction.id);
        if (index != -1) {
          List<Transaction> updatedTransactions = List.from(_transactions);
          updatedTransactions[index] =
              transaction.copyWith(status: TransactionStatus.approved.name);
          _transactions = updatedTransactions; // Re-assign the updated list
          notifyListeners();
        }
        return Result.success();
      } else {
        return Result.failure(message: response.data["title"]?.toString());
      }
    } catch (e) {
      debugPrint(e.toString());
      return Result.failure(message: e.toString());
    }
  }

  Future<Result> declineTransaction(Transaction transaction) async {
    try {
      Response response =
          await apiRepository.declineTransaction(transaction.id);
      if (response.statusCode == 200) {
        int index = _transactions.indexWhere((t) => t.id == transaction.id);
        if (index != -1) {
          List<Transaction> updatedTransactions = List.from(_transactions);
          updatedTransactions[index] =
              transaction.copyWith(status: TransactionStatus.declined.name);
          _transactions = updatedTransactions; // Re-assign the updated list
          notifyListeners();
        }

        return Result.success();
      } else {
        return Result.failure(message: response.data["title"]?.toString());
      }
    } catch (e) {
      debugPrint(e.toString());
      return Result.failure(message: e.toString());
    }
  }
}
