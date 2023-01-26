import 'package:flutter/material.dart';

@immutable
class MenuState {
  final int tabIndex;
  final bool isCollapsed;

  const MenuState({
    required this.tabIndex,
    required this.isCollapsed,
  });

  const MenuState.empty()
      : tabIndex = 0,
        isCollapsed = false;

  @override
  List<Object> get props => [tabIndex, isCollapsed];
}
