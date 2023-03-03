import 'package:flutter/material.dart';

class SearchBarController {
  const SearchBarController._();

  static final _userName = ValueNotifier<String>('');
  static ValueNotifier<String> get userName => _userName;
}
