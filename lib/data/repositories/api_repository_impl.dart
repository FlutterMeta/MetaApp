import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:meta_app/data/models/registration.dart';

import '../../core/utils/api_client.dart';
import '../../domain/repositories/api_repository.dart';
import '../models/user.dart';

class ApiRepositoryImpl implements ApiRepository {
  final ApiClient apiClient;

  ApiRepositoryImpl({required this.apiClient});

  @override
  Future<bool> login(String login, String password) async {
    try {
      Response response = await apiClient.post(
        '/Account/Login',
        body: {'Login': login, 'Password': password},
        isFormData: true,
      );
      if (response.statusCode != 200 && response.statusCode != 202) {
        print('Error: ${response.statusCode}');
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
      var response = await apiClient.post('/Account/Register', body: {
        'login': registration.login,
        'email': registration.email,
        'phoneNumber': registration.phoneNumber,
        'password': registration.password,
        'referal': registration.referal,
      });
      debugPrint(response.toString());
    } catch (e) {
      debugPrint(e.toString());
    }
    return true;
  }

  // ... implement the other methods
}
