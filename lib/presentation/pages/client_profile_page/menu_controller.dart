import 'package:flutter/material.dart';

abstract class MenuController {
  static ValueNotifier<int> tabIndex = ValueNotifier(0);
  static ValueNotifier<bool> isCollapsed = ValueNotifier(false);
}
