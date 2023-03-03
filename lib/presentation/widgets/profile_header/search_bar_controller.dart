import 'package:flutter/material.dart';

class SearchBarController {
  const SearchBarController._();

  static final _userMame = ValueNotifier<String>('');
  static ValueNotifier<String> get userMame => _userMame;
}
