// import 'package:flutter/material.dart';
// import 'package:dio/dio.dart';

// import '../../core/global.dart';
// import '../../data/models/referal_level.dart';
// import '../../data/models/result.dart';

// class LevelsNotifier extends ChangeNotifier {
//   final List<ReferalLevel> _levels = [];
//   List<ReferalLevel> get levels => _levels;

//   Future<Result> loadLevels() async {
//     try {
//       Response response = await apiRepository.getReferalLevels();
//       if (response.statusCode == 200) {
//         final data = response.data["\$values"] as List<dynamic>;

//         _levels.clear();
//         for (final levelData in data) {
//           ReferalLevel level =
//               ReferalLevel.fromJson(levelData as Map<String, dynamic>);
//           _levels.add(level);
//         }
//         // Sort levels by level
//         _levels.sort((a, b) => a.level.compareTo(b.level));
//         notifyListeners();
//         return Result.success();
//       } else {
//         return Result.failure(message: response.data.toString());
//       }
//     } catch (e) {
//       debugPrint(e.toString());
//       return Result.failure(message: e.toString());
//     }
//   }

//   Future<Result> addLevel(ReferalLevel level) async {
//     try {
//       Response response =
//           await apiRepository.createReferalLevel(level.toJson());

//       if (response.statusCode == 200) {
//         _levels.add(level);

//         notifyListeners();
//         return Result.success();
//       } else {
//         return Result.failure(message: response.data.toString());
//       }
//     } catch (e) {
//       debugPrint(e.toString());
//       return Result.failure(message: e.toString());
//     }
//   }

//   Future<Result> editLevel(ReferalLevel level) async {
//     try {
//       Response response =
//           await apiRepository.updateReferalLevel(level.id, level.toJson());
//       if (response.statusCode == 200) {
//         final index = levels.indexWhere((l) => l.id == level.id);
//         levels[index] = level;
//         notifyListeners();
//         return Result.success();
//       } else {
//         return Result.failure(message: response.data.toString());
//       }
//     } catch (e) {
//       debugPrint(e.toString());
//       return Result.failure(message: e.toString());
//     }
//   }
// }

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:meta_app/core/global.dart';
import 'package:meta_app/data/models/payment_system.dart';
import 'package:meta_app/data/models/result.dart';

class PaymentSystemNotifier extends ChangeNotifier {
  final List<PaymentSystem> _systems = [];
  List<PaymentSystem> get systems => _systems;

  Future<Result> loadSystems() async {
    try {
      Response response = await apiRepository.getPaymentSystems();
      if (response.statusCode == 200) {
        final data = response.data["\$values"] as List<dynamic>;

        _systems.clear();
        for (final system in data) {
          PaymentSystem paymentSystem =
              PaymentSystem.fromJson(system as Map<String, dynamic>);
          _systems.add(paymentSystem);
        }
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

  Future<PaymentSystem> loadSystemById(int id) async {
    try {
      Response response = await apiRepository.getPaymentSystem(id);
      if (response.statusCode == 200) {
        return PaymentSystem.fromJson(response.data);
      } else {
        throw Exception(response.data.toString());
      }
    } catch (e) {
      debugPrint(e.toString());
      throw Exception(e.toString());
    }
  }

  Future<Result> addSystem(PaymentSystem system) async {
    try {
      Response response =
          await apiRepository.createPaymentSystem(system.toJson());

      if (response.statusCode == 200) {
        _systems.add(system);

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

  Future<Result> editSystem(PaymentSystem system) async {
    try {
      Response response =
          await apiRepository.updatePaymentSystem(system.toJson());
      if (response.statusCode == 200) {
        final index = systems.indexWhere((s) => s.id == system.id);
        systems[index] = system;
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

  Future<Result> disablePaymentSystem(PaymentSystem system) async {
    try {
      Response response = await apiRepository.patchPaymentSystem(
        system.id,
        {"enabled": false},
      );
      if (response.statusCode == 200) {
        _systems.removeWhere((element) => element.id == system.id);
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
