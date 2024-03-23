import 'package:dio/dio.dart';

import '../../data/models/registration.dart';
import '../../data/models/user.dart';

abstract class ApiRepository {
  // ACCOUNT
  Future<Response> login(String email, String password);
  Future<Response> register(Registration registration);
  Future<Response> registerAdmin(Registration registration);
  Future<User?> userProfile();
  Future<Response> forgotPassword(String email);
  Future<Response> resetPassword(String email, String code, String password);
  Future<Response> deleteAccount(String id);

  // BLOG
  Future<Response> getBlogPosts();
  Future<Response> getBlogPost(int id);
  Future<Response> createBlogPost(Map<String, dynamic> body);
  Future<Response> updateBlogPost(int id, Map<String, dynamic> body);
  Future<Response> deleteBlogPost(int id);

  // ReferalLevels
  Future<Response> getReferalLevels();
  Future<Response> getReferalLevel(int id);
  Future<Response> createReferalLevel(Map<String, dynamic> body);
  Future<Response> updateReferalLevel(int id, Map<String, dynamic> body);

  // Products
  Future<Response> getProducts();
  Future<Response> getProduct(int id);
  Future<Response> createProduct(Map<String, dynamic> body);
  Future<Response> updateProduct(int id, Map<String, dynamic> body);
  Future<Response> deleteProduct(int id);
  Future<Response> getUserProducts(int userId);
  Future<Response> createPurchaseTransaction(
      int id, int paymentSystemId, String externalId);

  // PaymentSystem
  Future<Response> getPaymentSystems();
  Future<Response> getPaymentSystem(int id);
  Future<Response> createPaymentSystem(Map<String, dynamic> body);
  Future<Response> updatePaymentSystem(Map<String, dynamic> body);
  Future<Response> pathPaymentSystem(
    int id,
    Map<String, dynamic> body,
  ); //enable/disable

  // Transactions
  Future<Response> getTransactions({int? type, int? status, String? userId});
  Future<Response> createTransaction(Map<String, dynamic> body);
  Future<Response> declineTransaction(int id);
  Future<Response> approveTransaction(int id);

  // Users
  Future<Response> getUsers();
  Future<Response> getUser(String id);
  Future<Response> getAdmins();
  Future<Response> changeBalance(String id, double amount);
  Future<Response> getUserReferals(String id); //inviter id
}
