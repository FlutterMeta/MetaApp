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

  bool isSuccessfulStatusCode(int? statusCode) {
    return statusCode != null && statusCode >= 200 && statusCode < 300;
  }

  @override
  Future<Response> login(String login, String password) async {
    late Response response;
    try {
      response = await apiClient.post(
        '/Account/Login',
        body: {'Login': login, 'Password': password},
        isFormData: true,
      );

      html.window.localStorage["token"] = response.data["token"];
      if (!isSuccessfulStatusCode(response.statusCode)) {
        debugPrint('Error: ${response.statusCode}');
      }
      debugPrint(response.toString());
    } catch (e) {
      debugPrint(e.toString());
    }

    return response;
  }

  @override
  Future<Response> register(Registration registration) async {
    late Response response;

    try {
      response = await apiClient.post('/Account/Register', body: {
        'login': registration.login,
        'email': registration.email,
        'phoneNumber': registration.phoneNumber,
        'password': registration.password,
        'referal': registration.referal,
      });
      if (!isSuccessfulStatusCode(response.statusCode)) {
        debugPrint('Error: ${response.statusCode}');
      }
      debugPrint(response.toString());
      return response;
    } catch (e) {
      debugPrint(e.toString());
    }
    return response;
  }

  @override
  Future<User?> userProfile() async {
    late User? user;

    try {
      Response response = await apiClient.get('/User/Profile');
      if (!isSuccessfulStatusCode(response.statusCode)) {
        debugPrint('Error: ${response.statusCode}');
        return null;
      }
      debugPrint(response.toString());
      final rolesList =
          RoleList.fromJson(response.data['roles'] as Map<String, dynamic>);

      if (rolesList.values.isNotEmpty) {
        response.data['roles'] = rolesList.values.first; // Use the first role
      } else {
        response.data['roles'] = 'User'; // Default role
      }
      user = User.fromJson(response.data);
    } catch (e) {
      debugPrint(e.toString());
    }
    return user;
  }

  @override
  Future<Response> forgotPassword(String email) async {
    late Response response;

    try {
      response = await apiClient.post(
        '/Account/ForgotPassword',
        body: {
          'email': email,
        },
        isFormData: true,
      );
      if (!isSuccessfulStatusCode(response.statusCode)) {
        debugPrint('Error: ${response.statusCode}');
      }
      debugPrint(response.toString());
      return response;
    } catch (e) {
      debugPrint(e.toString());
    }
    return response;
  }

  @override
  Future<Response> resetPassword(
    String email,
    String code,
    String password,
  ) async {
    late Response response;

    try {
      response = await apiClient.post(
        '/Account/ResetPassword',
        body: {
          'UserEmail': email,
          'AuthenticationCode': code,
          'password': password,
          "confirmPassword": password,
        },
        isFormData: true,
      );
      if (!isSuccessfulStatusCode(response.statusCode)) {
        debugPrint('Error: ${response.statusCode}');
      }
      debugPrint(response.toString());
      return response;
    } catch (e) {
      debugPrint(e.toString());
    }
    return response;
  }

  @override
  Future<Response> deleteAccount() {
    // TODO: implement deleteAccount
    throw UnimplementedError();
  }

  @override
  Future<Response> registerAdmin(Registration registration) async {
    late Response response;

    try {
      response = await apiClient.post('/Account/RegisterAdmin', body: {
        'login': registration.login,
        'email': registration.email,
        'phoneNumber': registration.phoneNumber,
        'password': registration.password,
        'referal': registration.referal,
      });
      if (!isSuccessfulStatusCode(response.statusCode)) {
        debugPrint('Error: ${response.statusCode}');
      }
      return response;
    } catch (e) {
      debugPrint(e.toString());
    }
    return response;
  }
}
