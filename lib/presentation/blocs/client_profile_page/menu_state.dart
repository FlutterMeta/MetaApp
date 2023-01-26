import 'package:flutter/material.dart';

@immutable
class MenuState {
  final int tabIndex;
  final bool isCollapsed;
  final GlobalKey<ScaffoldState> scaffoldKey;

  const MenuState({
    required this.tabIndex,
    required this.isCollapsed,
    required this.scaffoldKey,
  });

  MenuState.empty()
      : tabIndex = 0,
        isCollapsed = false,
        scaffoldKey = GlobalKey<ScaffoldState>();
}
