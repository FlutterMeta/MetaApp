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
  Future<Response> deleteAccount();

  // BLOG
  Future<Response> getBlogPosts();
  Future<Response> getBlogPost(int id);
  Future<Response> createBlogPost(Map<String, dynamic> body);
  Future<Response> updateBlogPost(int id, Map<String, dynamic> body);
  Future<Response> deleteBlogPost(int id);
}
