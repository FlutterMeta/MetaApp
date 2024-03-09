import 'package:flutter/material.dart';

class ClientMenuController {
  const ClientMenuController._();

  static ValueNotifier<int> tabIndex = ValueNotifier(0);
  static ValueNotifier<bool> isCollapsed = ValueNotifier(false);
}
