import '../../data/models/registration.dart';
import '../../data/models/user.dart';

abstract class ApiRepository {
  Future<void> login(String email, String password);
  Future<void> register(Registration registration);
  // ... other methods for interacting with the API
}
