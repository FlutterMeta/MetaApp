import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

import '../../../core/global.dart';
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

  void init() async {
    _levels.clear();
    ReferalLevelStateHandler.controller.value--;
    preloadLevels();
  }

  final List<ReferalLevel> _levels = [];
}

void preloadLevels() async {
  Response response = await apiRepository.getReferalLevels();
  if (response.statusCode == 200) {
    final data = response.data["\$values"] as List<dynamic>;

    for (final level in data) {
      ReferalLevelStateHandler.instance
          .addlevel(ReferalLevel.fromJson(level as Map<String, dynamic>));
      ReferalLevelStateHandler.controller.value++;
    }
  }
}
