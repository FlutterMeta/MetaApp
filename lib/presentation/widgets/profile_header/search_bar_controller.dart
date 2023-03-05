import 'package:flutter/material.dart';

class SearchBarController {
  const SearchBarController._();

  static final _searchInput = ValueNotifier<String>('');

  static ValueNotifier<String> get searchInput => _searchInput;
}
