import 'package:flutter/material.dart';
import 'package:meta_app/data/models/registration.dart';

import '../../core/utils/api_client.dart';
import '../../domain/repositories/api_repository.dart';
import '../models/user.dart';

class ApiRepositoryImpl implements ApiRepository {
  final ApiClient apiClient;

  ApiRepositoryImpl({required this.apiClient});

  @override
  Future<void> login(String email, String password) async {
    var response = await apiClient
        .post('/Account/Login', body: {'email': email, 'password': password});
    debugPrint(response.toString());
  }

  @override
  Future<void> register(Registration registration) async {
    var response =
        await apiClient.post('/Account/Register', body: registration.toJson());
    debugPrint(response.toString());
  }

  // ... implement the other methods
}
