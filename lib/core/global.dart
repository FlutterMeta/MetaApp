import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:meta_app/core/utils/api_client.dart';
import 'package:meta_app/core/utils/token_storage.dart';
import '../data/repositories/api_repository_impl.dart';

// var baseUrl = 'http://localhost:8080';
String baseUrl = dotenv.env['BASE_URL']!;
TokenStorage tokenStorage = TokenStorage();

final _apiClient = ApiClient(baseUrl: baseUrl);
final apiRepository = ApiRepositoryImpl(apiClient: _apiClient);
