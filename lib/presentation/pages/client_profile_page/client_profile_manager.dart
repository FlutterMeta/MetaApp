import 'package:flutter/material.dart';

class ClientProfileManager with ChangeNotifier {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  int _currentIndex = 0;
  bool _isCollapsed = false;

  int get currentIndex => _currentIndex;
  bool get isCollapsed => _isCollapsed;

  GlobalKey<ScaffoldState> get scaffoldKey => _scaffoldKey;

  void changeSideMenuState() {
    if (!(_scaffoldKey.currentState?.isDrawerOpen ?? true)) {
      _scaffoldKey.currentState?.openDrawer();
    }
  }

  void changeCollapsedState() {
    _isCollapsed = !_isCollapsed;
    notifyListeners();
  }

  void changeIndex(int index) {
    _currentIndex = index;
    notifyListeners();
  }
}
