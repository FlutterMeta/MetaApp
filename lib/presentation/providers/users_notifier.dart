import 'package:flutter/cupertino.dart';
import 'package:dio/dio.dart';

import '../../core/global.dart';
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
          _users.add(User.fromJson(userData as Map<String, dynamic>));
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
        final userData = response.data as Map<String, dynamic>;
        _users.add(User.fromJson(userData));
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
}
