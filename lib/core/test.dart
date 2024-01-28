import 'package:meta_app/core/utils/api_client.dart';
import 'package:meta_app/domain/repositories/api_repository.dart';

import '../data/models/user.dart';
import '../data/repositories/api_repository_impl.dart';

void main(List<String> args) async {
  print('Hello, world!');

  ApiClient apiClient = ApiClient(
    baseUrl: 'http://localhost:8080',
    token:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9lbWFpbGFkZHJlc3MiOiJ2aXRhbGlpLnBldHJ1bkBnbWFpbC5jb20iLCJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9uYW1laWRlbnRpZmllciI6ImZlOWE0ZTAzLTAwNGEtNGRmYi05N2E5LWJiNDc1MjQ5YTk4QiIsImh0dHA6Ly9zY2hlbWFzLnhtbHNvYXAub3JnL3dzLzIwMDUvMDUvaWRlbnRpdHkvY2xhaW1zL21vYmlsZXBob25lIjoiMDY2ODM2NjQyMCIsImh0dHA6Ly9zY2hlbWFzLnhtbHNvYXAub3JnL3dzLzIwMDUvMDUvaWRlbnRpdHkvY2xhaW1zL25hbWUiOiJBZGFtIiwiaHR0cDovL3NjaGVtYXMubWljcm9zb2Z0LmNvbS93cy8yMDA4LzA2L2lkZW50aXR5L2NsYWltcy9yb2xlIjoiQWRhbSIsImV4cCI6MTcwOTAxOTg4NSwiaXNzIjoiQXVyb3JhQVBJIn0.Rdk8cTM4nso1UOPQ2XGIsLx78JJwET8LIbsJoq8z2u8 ',
  );
  ApiRepository apiRepository = ApiRepositoryImpl(apiClient: apiClient);
  User response = await apiRepository.userProfile();
}
