import 'package:flutter/cupertino.dart';

import '../../../data/models/blog.dart';

class BlogStateHandler {
  static BlogStateHandler get instance => _singleton;
  static final BlogStateHandler _singleton = BlogStateHandler._internal();
  BlogStateHandler._internal();

  // If controller value changes, the blog page will rebuild
  static final ValueNotifier<int> _controller = ValueNotifier(0);
  static ValueNotifier<int> get controller => _controller;

  List<Blog> get posts => _posts;
  void addPost(Blog post) => _posts.add(post);
  void removePost(Blog post) =>
      _posts.removeWhere((element) => element.id == post.id);
  void editPost(Blog post) {
    final index = _posts.indexWhere((element) => element.id == post.id);
    _posts[index] = post;
  }

  final List<Blog> _posts = [];
}
