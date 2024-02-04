import 'package:flutter/cupertino.dart';
import 'package:dio/dio.dart';

import '../../core/global.dart';
import '../../data/models/role_list.dart';
import '../../data/models/transaction.dart';
import '../../data/models/user.dart';

class UsersNotifier extends ChangeNotifier {
  final List<User> _users = [];
  List<User> get users => _users;

  Future<void> loadUsers() async {
    try {
      Response response = await apiRepository.getUsers();
      if (response.statusCode == 200) {
        final data = response.data["\$values"] as List<dynamic>;

        for (final userData in data) {
          User user = User.fromJson(userData as Map<String, dynamic>);

          _users.add(user);
        }
        notifyListeners();
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  Future<void> loadUser(String userId) async {
    try {
      Response response = await apiRepository.getUser(userId);
      if (response.statusCode == 200) {
        User user = User.fromJson(response.data);
        _users.add(user);
        notifyListeners();
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  Future<void> loadAdmins() async {
    try {
      Response response = await apiRepository.getAdmins();
      if (response.statusCode == 200) {
        final data = response.data["\$values"] as List<dynamic>;

        for (final adminData in data) {
          _users.add(User.fromJson(adminData as Map<String, dynamic>));
        }
        notifyListeners();
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  Future<void> changeBalance(String userId, double amount) async {
    try {
      Response response = await apiRepository.changeBalance(userId, amount);
      if (response.statusCode == 200) {
        users.firstWhere((user) => user.id == userId).balance = amount;
        notifyListeners();
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  Future<void> getUserReferals(String userId) async {
    try {
      Response response = await apiRepository.getUserReferals(userId);
      if (response.statusCode == 200) {
        final data = response.data["\$values"] as List<dynamic>;

        for (final referalData in data) {
          _users.add(User.fromJson(referalData as Map<String, dynamic>));
        }
        notifyListeners();
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  Future<void> deleteUser(String userId) async {
    try {
      Response response = await apiRepository.deleteAccount(userId);
      if (response.statusCode == 200) {
        _users.removeWhere((user) => user.id == userId);
        notifyListeners();
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  void getUserTransactions(String userId) async {
    try {
      Response response = await apiRepository.getTransactions(
        userId: userId,
      );
      if (response.statusCode == 200) {
        final data = response.data["\$values"] as List<dynamic>;

        users.firstWhere((user) => user.id == userId).transactions = data
            .map((transactionData) =>
                Transaction.fromJson(transactionData as Map<String, dynamic>))
            .toList();
        notifyListeners();
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
