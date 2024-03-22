import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:meta_app/core/global.dart';
import 'package:meta_app/data/models/blog.dart';
import 'package:meta_app/data/models/result.dart';

class BlogsNotifier extends ChangeNotifier {
  bool _isLoading = false;

  final List<Blog> _blogs = [];
  List<Blog> get blogs => _blogs;
  bool get isLoading => _isLoading;

  Future<Result> loadBlogs() async {
    try {
      _isLoading = true;
      Response response = await apiRepository.getBlogPosts();
      if (response.statusCode == 200) {
        final data = response.data["\$values"] as List<dynamic>;

        _blogs.clear();
        for (final blogData in data) {
          Blog blog = Blog.fromJson(blogData as Map<String, dynamic>);
          _blogs.add(blog);
        }
        _isLoading = false;
        notifyListeners();

        return Result.success();
      } else {
        return Result.failure(message: response.data.toString());
      }
    } catch (e) {
      debugPrint(e.toString());
      return Result.failure(message: e.toString());
    }
  }

  Future<Result> addBlog(Blog blog) async {
    try {
      Response response = await apiRepository.createBlogPost(blog.toJson());

      if (response.statusCode == 200) {
        _blogs.add(blog);

        notifyListeners();
        return Result.success();
      } else {
        return Result.failure(message: response.data.toString());
      }
    } catch (e) {
      debugPrint(e.toString());
      return Result.failure(message: e.toString());
    }
  }

  Future<Result> editBlog(Blog blog) async {
    try {
      Response response =
          await apiRepository.updateBlogPost(blog.id, blog.toJson());
      if (response.statusCode == 200) {
        final index = blogs.indexWhere((b) => b.id == blog.id);
        blogs[index] = blog;
        notifyListeners();
        return Result.success();
      } else {
        return Result.failure(message: response.data.toString());
      }
    } catch (e) {
      debugPrint(e.toString());
      return Result.failure(message: e.toString());
    }
  }

  Future<Result> deleteBlog(int id) async {
    try {
      Response response = await apiRepository.deleteBlogPost(id);
      if (response.statusCode == 200) {
        _blogs.removeWhere((b) => b.id == id);
        notifyListeners();
        return Result.success();
      } else {
        return Result.failure(message: response.data.toString());
      }
    } catch (e) {
      debugPrint(e.toString());
      return Result.failure(message: e.toString());
    }
  }
}
