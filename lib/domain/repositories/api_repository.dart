import '../../data/models/registration.dart';
import '../../data/models/user.dart';

abstract class ApiRepository {
  Future<bool> login(String email, String password);
  Future<bool> register(Registration registration);
  Future<User> userProfile();
  // ... other methods for interacting with the API
}
