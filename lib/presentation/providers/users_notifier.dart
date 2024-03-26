import 'package:flutter/cupertino.dart';
import 'package:dio/dio.dart';

import '../../core/global.dart';
import '../../data/models/result.dart';
import '../../data/models/transaction.dart';
import '../../data/models/user.dart';

class UsersNotifier extends ChangeNotifier {
  final List<User> _users = [];
  List<User> get users => _users;

  Future<Result> loadUsers() async {
    try {
      Response response = await apiRepository.getUsers();
      if (response.statusCode == 200) {
        final data = response.data["\$values"] as List<dynamic>;

        _users.clear();
        for (final userData in data) {
          User user = User.fromJson(userData as Map<String, dynamic>);
          _users.add(user);
        }
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

  Future<Result> loadUser(String userId) async {
    try {
      Response response = await apiRepository.getUser(userId);
      if (response.statusCode == 200) {
        User user = User.fromJson(response.data);
        _users.add(user);
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

  Future<Result> loadAdmins() async {
    try {
      Response response = await apiRepository.getAdmins();
      if (response.statusCode == 200) {
        final data = response.data["\$values"] as List<dynamic>;

        _users.clear();
        for (final adminData in data) {
          _users.add(User.fromJson(adminData as Map<String, dynamic>));
        }
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

  Future<Result> changeBalance(String userId, double amount) async {
    try {
      Response response = await apiRepository.changeBalance(userId, amount);
      if (response.statusCode == 200) {
        users.firstWhere((user) => user.id == userId).balance = amount;
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

  Future<Result> getUserReferals(String userId) async {
    try {
      Response response = await apiRepository.getUserReferals(userId);
      if (response.statusCode == 200) {
        final data = response.data["\$values"] as List<dynamic>;

        _users.clear();
        for (final referalData in data) {
          _users.add(User.fromJson(referalData as Map<String, dynamic>));
        }
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

  Future<Result> deleteUser(String userId) async {
    try {
      Response response = await apiRepository.deleteAccount(userId);
      if (response.statusCode == 200) {
        _users.removeWhere((user) => user.id == userId);
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

  Future<Result> getUserTransactionsByAdmin(String userId) async {
    try {
      Response response = await apiRepository.getTransactions(userId: userId);

      if (response.statusCode == 200) {
        final data = response.data["\$values"] as List<dynamic>;

        users.firstWhere((user) => user.id == userId).transactions = data
            .map((transactionData) =>
                Transaction.fromJson(transactionData as Map<String, dynamic>))
            .toList();
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

  Future<Result> getUserTransactions(String userId) async {
    try {
      Response response = await apiRepository.getUserTransactions();

      if (response.statusCode == 200) {
        final data = response.data["\$values"] as List<dynamic>;

        users.firstWhere((user) => user.id == userId).transactions = data
            .map((transactionData) =>
                Transaction.fromJson(transactionData as Map<String, dynamic>))
            .toList();
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
}
