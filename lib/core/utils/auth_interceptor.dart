import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:meta_app/core/utils/token_storage.dart';

// TokenStorage is called in runtime and manages the token
// AuthInterceptor is used to add the token to the request headers
// AuthInterceptor uses TokenStorage to get the token
// -> every request will have the actual token in the headers.

class AuthInterceptor extends Interceptor {
  final TokenStorage tokenStorage = TokenStorage();

  @override
  Future onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    String? token = await tokenStorage.getToken();
    if (token != null) {
      options.headers['Authorization'] = 'Bearer $token';
    }
    debugPrint('Request headers: ${options.headers}');

    return super.onRequest(options, handler);
  }
}
