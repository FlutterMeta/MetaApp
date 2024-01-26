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
        print('Response text: ${response.statusMessage}');
        return handler.next(response); // continue
      },
      onError: (DioError e, handler) {
        // Log the error
        print('Error: ${e.message}');
        print('Error response: ${e.response}');
        return handler.next(e); //continue
      },
    ));
  }

  Future<Response<dynamic>> get(String endpoint) async {
    // Perform a GET request
    return dio.get(endpoint);
  }

  Future<Response<dynamic>> post(
    String endpoint, {
    dynamic body,
    bool isFormData = false,
  }) async {
    // Check if the body should be sent as FormData
    final data = isFormData ? FormData.fromMap(body) : body;

    // Log the request type
    final contentType = isFormData ? 'FormData/multipart' : 'JSON';
    print('Sending POST request to $endpoint with $contentType: $body');

    // Perform a POST request with the appropriate content type
    return dio.post(
      endpoint,
      data: data,
      options: Options(
        contentType: isFormData ? 'multipart/form-data' : 'application/json',
      ),
    );
  }

  Future<Response<dynamic>> put(
    String endpoint, {
    required dynamic body,
  }) async {
    // Perform a PUT request
    return dio.put(endpoint, data: body);
  }

  Future<Response<dynamic>> delete(String endpoint) async {
    // Perform a DELETE request
    return dio.delete(endpoint);
  }
}
