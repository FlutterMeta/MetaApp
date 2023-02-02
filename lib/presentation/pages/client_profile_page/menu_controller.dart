import 'package:flutter/material.dart';

class MenuController {
  const MenuController._();

  static ValueNotifier<int> tabIndex = ValueNotifier(0);
  static ValueNotifier<bool> isCollapsed = ValueNotifier(false);
}
