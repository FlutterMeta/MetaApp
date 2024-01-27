import '../../data/models/registration.dart';
import '../../data/models/user.dart';

abstract class ApiRepository {
  // ACCOUNT
  Future<bool> login(String email, String password);
  Future<bool> register(Registration registration);
  Future<bool> registerAdmin(Registration registration);
  Future<User> userProfile();
  Future<bool> forgotPassword(String email);
  Future<bool> resetPassword(String email, int code, String password);
  Future<bool> deleteAccount();

  // ... other methods for interacting with the API
}
