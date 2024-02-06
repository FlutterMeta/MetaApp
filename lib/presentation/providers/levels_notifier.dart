import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

import '../../core/global.dart';
import '../../data/models/referal_level.dart';
import '../../data/models/result.dart';

class LevelsNotifier extends ChangeNotifier {
  final List<ReferalLevel> _levels = [];
  List<ReferalLevel> get levels => _levels;

  Future<Result> loadLevels() async {
    try {
      Response response = await apiRepository.getReferalLevels();
      if (response.statusCode == 200) {
        final data = response.data["\$values"] as List<dynamic>;

        _levels.clear();
        for (final levelData in data) {
          ReferalLevel level =
              ReferalLevel.fromJson(levelData as Map<String, dynamic>);
          _levels.add(level);
        }
        // Sort levels by level
        _levels.sort((a, b) => a.level.compareTo(b.level));
        notifyListeners();
        return Result.success();
      } else {
        return Result.failure(message: response.data.toString());
      }
    } catch (e) {
      debugPrint(e.toString());
      return Result.failure(message: e.toString());
    }
  }

  Future<Result> addLevel(ReferalLevel level) async {
    try {
      Response response =
          await apiRepository.createReferalLevel(level.toJson());

      if (response.statusCode == 200) {
        _levels.add(level);

        notifyListeners();
        return Result.success();
      } else {
        return Result.failure(message: response.data.toString());
      }
    } catch (e) {
      debugPrint(e.toString());
      return Result.failure(message: e.toString());
    }
  }

  Future<Result> editLevel(ReferalLevel level) async {
    try {
      Response response =
          await apiRepository.updateReferalLevel(level.id, level.toJson());
      if (response.statusCode == 200) {
        final index = levels.indexWhere((l) => l.id == level.id);
        levels[index] = level;
        notifyListeners();
        return Result.success();
      } else {
        return Result.failure(message: response.data.toString());
      }
    } catch (e) {
      debugPrint(e.toString());
      return Result.failure(message: e.toString());
    }
  }
}
