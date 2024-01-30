import 'package:flutter/cupertino.dart';

import '../../../data/models/referal_level.dart';

class ReferalLevelStateHandler {
  static ReferalLevelStateHandler get instance => _singleton;
  static final ReferalLevelStateHandler _singleton =
      ReferalLevelStateHandler._internal();
  ReferalLevelStateHandler._internal();

  // If controller value changes, the ReferalLevel page will rebuild
  static final ValueNotifier<int> _controller = ValueNotifier(0);
  static ValueNotifier<int> get controller => _controller;

  List<ReferalLevel> get levels => _levels;
  void addlevel(ReferalLevel level) => _levels.add(level);
  void removelevel(ReferalLevel level) =>
      _levels.removeWhere((element) => element.id == level.id);
  void editlevel(ReferalLevel level) {
    final index = _levels.indexWhere((element) => element.id == level.id);
    _levels[index] = level;
  }

  final List<ReferalLevel> _levels = [];
}
