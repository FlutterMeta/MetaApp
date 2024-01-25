import 'package:dio/dio.dart';

class ApiClient {
  final String baseUrl;
  final String token;
  final Dio dio = Dio();

  ApiClient({required this.baseUrl, required this.token}) {
    dio.options.baseUrl = baseUrl;
    dio.options.headers = <String, dynamic>{
      'accept': '*/*',
      'content-type': 'application/json',
      'authorization': 'Bearer $token',
    };

    dio.interceptors.add(InterceptorsWrapper(
      onRequest: (RequestOptions options, handler) {
        // Log the request
        print('Sending request: ${options.method} ${options.path}');
        print('Request headers: ${options.headers}');
        print('Request body: ${options.data}');
        return handler.next(options); //continue
      },
      onResponse: (Response response, handler) {
        // Log the response
        print('Response status: ${response.statusCode}');
        print('Response body: ${response.data}');
        return handler.next(response); // continue
      },
      onError: (DioError e, handler) {
        // Log the error
        print('Error: ${e.message}');
        return handler.next(e); //continue
      },
    ));
  }

  Future<Response<dynamic>> get(String endpoint) async {
    // Perform a GET request
    return dio.get(endpoint);
  }

  Future<Response<dynamic>> post(String endpoint,
      {required dynamic body}) async {
    // Perform a POST request
    print('Sending POST request to $endpoint with body: $body');
    return dio.post(endpoint, data: body);
  }

  Future<Response<dynamic>> put(String endpoint,
      {required dynamic body}) async {
    // Perform a PUT request
    return dio.put(endpoint, data: body);
  }

  Future<Response<dynamic>> delete(String endpoint) async {
    // Perform a DELETE request
    return dio.delete(endpoint);
  }
}
