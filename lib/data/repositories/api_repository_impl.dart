import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:meta_app/data/models/registration.dart';

import '../../core/utils/api_client.dart';
import '../../domain/repositories/api_repository.dart';

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

      if (!isSuccessfulStatusCode(response.statusCode)) {
        debugPrint('API Error: ${response.statusCode}');
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
        debugPrint('API Error: ${response.statusCode}');
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
        debugPrint('API Error: ${response.statusCode}');
        return null;
      }
      debugPrint(response.toString());

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
        debugPrint('API Error: ${response.statusCode}');
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
        debugPrint('API Error: ${response.statusCode}');
      }
      debugPrint(response.toString());
      return response;
    } catch (e) {
      debugPrint(e.toString());
    }
    return response;
  }

  @override
  Future<Response> deleteAccount(String id) async {
    late Response response;

    try {
      response = await apiClient.patch('/Account/$id', body: {}); //Soft delete
      if (!isSuccessfulStatusCode(response.statusCode)) {
        debugPrint('API Error: ${response.statusCode}');
      }
      debugPrint(response.toString());
      return response;
    } catch (e) {
      debugPrint(e.toString());
    }
    return response;
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
        debugPrint('API Error: ${response.statusCode}');
      }
      return response;
    } catch (e) {
      debugPrint(e.toString());
    }
    return response;
  }

  @override
  Future<Response> createBlogPost(Map<String, dynamic> body) async {
    late Response response;
    try {
      response = await apiClient.post('/Blog', body: body);
      if (!isSuccessfulStatusCode(response.statusCode)) {
        debugPrint('API Error: ${response.statusCode}');
      }
      debugPrint(response.toString());
    } catch (e) {
      debugPrint(e.toString());
    }
    return response;
  }

  @override
  Future<Response> deleteBlogPost(int id) async {
    late Response response;
    try {
      response = await apiClient.delete('/Blog/$id');
      if (!isSuccessfulStatusCode(response.statusCode)) {
        debugPrint('API Error: ${response.statusCode}');
      }
      debugPrint(response.toString());
    } catch (e) {
      debugPrint(e.toString());
    }
    return response;
  }

  @override
  Future<Response> getBlogPost(int id) async {
    late Response response;
    try {
      response = await apiClient.get('/Blog/$id');
      if (!isSuccessfulStatusCode(response.statusCode)) {
        debugPrint('API Error: ${response.statusCode}');
      }
      debugPrint(response.toString());
    } catch (e) {
      debugPrint(e.toString());
    }
    return response;
  }

  @override
  Future<Response> getBlogPosts() async {
    late Response response;
    try {
      response = await apiClient.get('/Blog');
      if (!isSuccessfulStatusCode(response.statusCode)) {
        debugPrint('API Error: ${response.statusCode}');
      }
      debugPrint(response.toString());
    } catch (e) {
      debugPrint(e.toString());
    }
    return response;
  }

  @override
  Future<Response> updateBlogPost(int id, Map<String, dynamic> body) async {
    late Response response;
    try {
      response = await apiClient.put('/Blog', body: body);
      if (!isSuccessfulStatusCode(response.statusCode)) {
        debugPrint('API Error: ${response.statusCode}');
      }
      debugPrint(response.toString());
    } catch (e) {
      debugPrint(e.toString());
    }
    return response;
  }

  @override
  Future<Response> createReferalLevel(Map<String, dynamic> body) async {
    late Response response;
    try {
      response = await apiClient.post('/ReferalLevel', body: body);

      if (!isSuccessfulStatusCode(response.statusCode)) {
        debugPrint('API Error: ${response.statusCode}');
      }
      debugPrint(response.toString());
    } catch (e) {
      debugPrint(e.toString());
    }
    return response;
  }

  @override
  Future<Response> getReferalLevels() async {
    late Response response;
    try {
      response = await apiClient.get('/ReferalLevel');
      if (!isSuccessfulStatusCode(response.statusCode)) {
        debugPrint('API Error: ${response.statusCode}');
      }
      debugPrint(response.toString());
      return response;
    } catch (e) {
      debugPrint(e.toString());
    }
    return response;
  }

  @override
  Future<Response> updateReferalLevel(int id, Map<String, dynamic> body) async {
    late Response response;
    try {
      response = await apiClient.put('/ReferalLevel/$id', body: body);
      if (!isSuccessfulStatusCode(response.statusCode)) {
        debugPrint('API Error: ${response.statusCode}');
      }
      debugPrint(response.toString());
      return response;
    } catch (e) {
      debugPrint(e.toString());
    }
    return response;
  }

  @override
  Future<Response> getReferalLevel(int id) async {
    late Response response;
    try {
      response = await apiClient.get('/ReferalLevel/$id');
      if (!isSuccessfulStatusCode(response.statusCode)) {
        debugPrint('API Error: ${response.statusCode}');
      }
      debugPrint(response.toString());
      return response;
    } catch (e) {
      debugPrint(e.toString());
    }
    return response;
  }

  @override
  Future<Response> createProduct(Map<String, dynamic> body) async {
    late Response response;
    try {
      response = await apiClient.post('/Product', body: body);
      if (!isSuccessfulStatusCode(response.statusCode)) {
        debugPrint('API Error: ${response.statusCode}');
      }
      debugPrint(response.toString());
      return response;
    } catch (e) {
      debugPrint(e.toString());
    }
    return response;
  }

  @override
  Future<Response> createPurchaseTransaction(
    int id,
    int paymentSystemId,
    String externalId,
  ) async {
    late Response response;
    try {
      response = await apiClient.post(
          '/Product/purchase/$id?paymentSystemId=$paymentSystemId&externalId=$externalId',
          body: {});
      if (!isSuccessfulStatusCode(response.statusCode)) {
        debugPrint('API Error: ${response.statusCode}');
      }
      debugPrint(response.toString());
      return response;
    } catch (e) {
      debugPrint(e.toString());
    }
    return response;
  }

  @override
  Future<Response> deleteProduct(int id) async {
    late Response response;
    try {
      response = await apiClient.delete('/Product/$id');
      if (!isSuccessfulStatusCode(response.statusCode)) {
        debugPrint('API Error: ${response.statusCode}');
      }
      debugPrint(response.toString());
      return response;
    } catch (e) {
      debugPrint(e.toString());
    }
    return response;
  }

  @override
  Future<Response> getProduct(int id) async {
    late Response response;
    try {
      response = await apiClient.get('/Product/$id');
      if (!isSuccessfulStatusCode(response.statusCode)) {
        debugPrint('API Error: ${response.statusCode}');
      }
      debugPrint(response.toString());
      return response;
    } catch (e) {
      debugPrint(e.toString());
    }
    return response;
  }

  @override
  Future<Response> getProducts() async {
    late Response response;
    try {
      response = await apiClient.get('/Product');
      if (!isSuccessfulStatusCode(response.statusCode)) {
        debugPrint('API Error: ${response.statusCode}');
      }
      debugPrint(response.toString());
      return response;
    } catch (e) {
      debugPrint(e.toString());
    }
    return response;
  }

  @override
  Future<Response> getUserProducts(int userId) async {
    late Response response;
    try {
      response = await apiClient.get('/User/$userId/Product');
      if (!isSuccessfulStatusCode(response.statusCode)) {
        debugPrint('API Error: ${response.statusCode}');
      }
      debugPrint(response.toString());
      return response;
    } catch (e) {
      debugPrint(e.toString());
    }
    return response;
  }

  @override
  Future<Response> updateProduct(int id, Map<String, dynamic> body) async {
    late Response response;
    try {
      response = await apiClient.put('/Product', body: body);
      if (!isSuccessfulStatusCode(response.statusCode)) {
        debugPrint('API Error: ${response.statusCode}');
      }
      return response;
    } catch (e) {
      debugPrint(e.toString());
    }
    return response;
  }

  @override
  Future<Response> createPaymentSystem(Map<String, dynamic> body) async {
    late Response response;
    try {
      response = await apiClient.post('/PaymentSystem', body: body);
      if (!isSuccessfulStatusCode(response.statusCode)) {
        debugPrint('API Error: ${response.statusCode}');
      }
      return response;
    } catch (e) {
      debugPrint(e.toString());
    }
    return response;
  }

  @override
  Future<Response> patchPaymentSystem(int id, Map<String, dynamic> body) async {
    late Response response;
    try {
      response = await apiClient
          .patch('/PaymentSystem/$id?enabled=${body['enabled']}', body: {});
      if (!isSuccessfulStatusCode(response.statusCode)) {
        debugPrint('API Error: ${response.statusCode}');
      }
      return response;
    } catch (e) {
      debugPrint(e.toString());
    }
    return response;
  }

  @override
  Future<Response> getPaymentSystem(int id) async {
    late Response response;
    try {
      response = await apiClient.get('/PaymentSystem/$id');
      if (!isSuccessfulStatusCode(response.statusCode)) {
        debugPrint('API Error: ${response.statusCode}');
      }
      return response;
    } catch (e) {
      debugPrint(e.toString());
    }
    return response;
  }

  @override
  Future<Response> getPaymentSystems() async {
    late Response response;
    try {
      response = await apiClient.get('/PaymentSystem');
      if (!isSuccessfulStatusCode(response.statusCode)) {
        debugPrint('API Error: ${response.statusCode}');
      }
      return response;
    } catch (e) {
      debugPrint(e.toString());
    }
    return response;
  }

  @override
  Future<Response> updatePaymentSystem(
    Map<String, dynamic> body,
  ) async {
    late Response response;
    try {
      response = await apiClient.put('/PaymentSystem', body: body);
      if (!isSuccessfulStatusCode(response.statusCode)) {
        debugPrint('API Error: ${response.statusCode}');
      }
      return response;
    } catch (e) {
      debugPrint(e.toString());
    }
    return response;
  }

  @override
  Future<Response> createTransaction(Map<String, dynamic> body) async {
    late Response response;
    try {
      response = await apiClient.post('/Transaction/withdrawal', body: body);
      if (!isSuccessfulStatusCode(response.statusCode)) {
        debugPrint('API Error: ${response.statusCode}');
      }
      return response;
    } catch (e) {
      debugPrint(e.toString());
    }
    return response;
  }

  @override
  Future<Response> declineTransaction(int id) async {
    late Response response;
    try {
      response = await apiClient.patch('/Transaction/decline/$id', body: {});
      if (!isSuccessfulStatusCode(response.statusCode)) {
        debugPrint('API Error: ${response.statusCode}');
      }
      return response;
    } catch (e) {
      debugPrint(e.toString());
    }
    return response;
  }

  @override
  Future<Response> approveTransaction(int id) async {
    late Response response;
    try {
      response = await apiClient.patch('/Transaction/approve/$id', body: {});
      if (!isSuccessfulStatusCode(response.statusCode)) {
        debugPrint('API Error: ${response.statusCode}');
      }
      return response;
    } catch (e) {
      debugPrint(e.toString());
    }
    return response;
  }

  @override
  Future<Response> getTransactions({
    int? type,
    int? status,
    String? userId,
  }) async {
    late Response response;
    try {
      String request = '/Transaction';

      if (type != null) {
        request += '?Type=$type';
      }

      if (status != null) {
        request += '${request.contains('?') ? '&' : '?'}Status=$status';
      }

      if (userId != null) {
        request +=
            '${request.contains('?') || request.contains('&') ? '&' : '?'}UserId=$userId';
      }

      response = await apiClient.get(request);
      if (!isSuccessfulStatusCode(response.statusCode)) {
        debugPrint('API Error: ${response.statusCode}');
      }
      return response;
    } catch (e) {
      debugPrint(e.toString());
    }
    return response;
  }

  @override
  Future<Response> changeBalance(String id, double amount) async {
    late Response response;
    try {
      response = await apiClient.patch('/User/Balance/$id', body: amount);
      if (!isSuccessfulStatusCode(response.statusCode)) {
        debugPrint('API Error: ${response.statusCode}');
      }
      return response;
    } catch (e) {
      debugPrint(e.toString());
    }
    return response;
  }

  @override
  Future<Response> getAdmins() async {
    late Response response;
    try {
      response = await apiClient.get('/User/admins');
      if (!isSuccessfulStatusCode(response.statusCode)) {
        debugPrint('API Error: ${response.statusCode}');
      }
      return response;
    } catch (e) {
      debugPrint(e.toString());
    }
    return response;
  }

  @override
  Future<Response> getUser(String id) async {
    late Response response;
    try {
      response = await apiClient.get('/User/$id');
      if (!isSuccessfulStatusCode(response.statusCode)) {
        debugPrint('API Error: ${response.statusCode}');
      }
      return response;
    } catch (e) {
      debugPrint(e.toString());
    }
    return response;
  }

  @override
  Future<Response> getUserReferals(String id) async {
    late Response response;
    try {
      response = await apiClient.get('/User/referrals/$id');
      if (!isSuccessfulStatusCode(response.statusCode)) {
        debugPrint('API Error: ${response.statusCode}');
      }
      return response;
    } catch (e) {
      debugPrint(e.toString());
    }
    return response;
  }

  @override
  Future<Response> getUserTransactions({int? type, int? status}) async {
    late Response response;
    try {
      String request = '/User/transactions';
      if (type != null) {
        request += '?Type=$type';
      }
      if (status != null) {
        request += '${request.contains('?') ? '&' : '?'}Status=$status';
      }
      response = await apiClient.get(request);
      if (!isSuccessfulStatusCode(response.statusCode)) {
        debugPrint('API Error: ${response.statusCode}');
      }
      return response;
    } catch (e) {
      debugPrint(e.toString());
    }
    return response;
  }

  @override
  Future<Response> getUsers() async {
    late Response response;
    try {
      response = await apiClient.get('/User');
      if (!isSuccessfulStatusCode(response.statusCode)) {
        debugPrint('API Error: ${response.statusCode}');
      }
      return response;
    } catch (e) {
      debugPrint(e.toString());
    }
    return response;
  }
}
