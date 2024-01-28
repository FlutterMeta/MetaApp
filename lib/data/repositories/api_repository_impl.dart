import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:meta_app/data/models/registration.dart';
import 'dart:html' as html;

import '../../core/utils/api_client.dart';
import '../../domain/repositories/api_repository.dart';
import '../models/role_list.dart';
import '../models/user.dart';

class ApiRepositoryImpl implements ApiRepository {
  final ApiClient apiClient;

  ApiRepositoryImpl({required this.apiClient});

  bool _isSuccessfulStatusCode(int? statusCode) {
    return statusCode != null && statusCode >= 200 && statusCode < 300;
  }

  @override
  Future<bool> login(String login, String password) async {
    try {
      Response response = await apiClient.post(
        '/Account/Login',
        body: {'Login': login, 'Password': password},
        isFormData: true,
      );
      html.window.localStorage["token"] = response.data["token"];
      if (!_isSuccessfulStatusCode(response.statusCode)) {
        debugPrint('Error: ${response.statusCode}');
        return false;
      }
      debugPrint(response.toString());
    } catch (e) {
      debugPrint(e.toString());
    }
    return true;
  }

  @override
  Future<bool> register(Registration registration) async {
    try {
      Response response = await apiClient.post('/Account/Register', body: {
        'login': registration.login,
        'email': registration.email,
        'phoneNumber': registration.phoneNumber,
        'password': registration.password,
        'referal': registration.referal,
      });
      if (!_isSuccessfulStatusCode(response.statusCode)) {
        debugPrint('Error: ${response.statusCode}');
        return false;
      }
      debugPrint(response.toString());
    } catch (e) {
      debugPrint(e.toString());
    }
    return true;
  }

  @override
  Future<User> userProfile() async {
    try {
      Response response = await apiClient.get('/User/Profile');
      if (!_isSuccessfulStatusCode(response.statusCode)) {
        debugPrint('Error: ${response.statusCode}');
        return User.empty();
      }
      debugPrint(response.toString());
      final rolesList =
          RoleList.fromJson(response.data['roles'] as Map<String, dynamic>);

      if (rolesList.values.isNotEmpty) {
        response.data['roles'] = rolesList.values.first; // Use the first role
      } else {
        response.data['roles'] = 'User'; // Default role
      }

      return User.fromJson(response.data);
    } catch (e) {
      debugPrint(e.toString());
    }
    return User.empty();
  }

  @override
  Future<bool> forgotPassword(String email) async {
    try {
      Response response = await apiClient.post(
        '/Account/ForgotPassword',
        body: {
          'email': email,
        },
        isFormData: true,
      );
      if (!_isSuccessfulStatusCode(response.statusCode)) {
        debugPrint('Error: ${response.statusCode}');
        return false;
      }
      debugPrint(response.toString());
    } catch (e) {
      debugPrint(e.toString());
    }
    return true;
  }

  @override
  Future<bool> resetPassword(String email, int code, String password) async {
    try {
      Response response = await apiClient.post(
        '/Account/ResetPassword',
        body: {
          'email': email,
          'code': code,
          'password': password,
          "confirmPassword": password,
        },
        isFormData: true,
      );
      if (!_isSuccessfulStatusCode(response.statusCode)) {
        debugPrint('Error: ${response.statusCode}');
        return false;
      }
      debugPrint(response.toString());
    } catch (e) {
      debugPrint(e.toString());
    }
    return true;
  }

  @override
  Future<bool> deleteAccount() {
    // TODO: implement deleteAccount
    throw UnimplementedError();
  }

  @override
  Future<bool> registerAdmin(Registration registration) async {
    try {
      Response response = await apiClient.post('/Account/RegisterAdmin', body: {
        'login': registration.login,
        'email': registration.email,
        'phoneNumber': registration.phoneNumber,
        'password': registration.password,
        'referal': registration.referal,
      });
      if (!_isSuccessfulStatusCode(response.statusCode)) {
        debugPrint('Error: ${response.statusCode}');
        return false;
      }
    } catch (e) {
      debugPrint(e.toString());
      return false;
    }
    return true;
  }
}
