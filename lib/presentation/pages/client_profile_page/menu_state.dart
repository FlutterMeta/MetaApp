import 'package:flutter/material.dart';

abstract class MenuState {
  static ValueNotifier<int> tabIndex = ValueNotifier(0);
  static ValueNotifier<bool> isCollapsed = ValueNotifier(false);
}
