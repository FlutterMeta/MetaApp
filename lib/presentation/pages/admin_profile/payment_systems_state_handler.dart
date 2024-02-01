import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

import '../../../core/global.dart';
import '../../../data/models/payment_system.dart';

class PaymentSystemsStateHandler {
  static PaymentSystemsStateHandler get instance => _singleton;
  static final PaymentSystemsStateHandler _singleton =
      PaymentSystemsStateHandler._internal();
  PaymentSystemsStateHandler._internal();

  // If controller value changes, the PaymentSystem page will rebuild
  static final ValueNotifier<int> _controller = ValueNotifier(0);
  static ValueNotifier<int> get controller => _controller;

  List<PaymentSystem> get systems => _systems;
  void addSystem(PaymentSystem system) {
    try {
      apiRepository.createPaymentSystem(system.toJson());
      _systems.add(system);
      PaymentSystemsStateHandler.controller.value++;
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  void removeSystem(PaymentSystem system) {
    try {
      apiRepository.deletePaymentSystem(system.id);
      _systems.removeWhere((element) => element.id == system.id);
      PaymentSystemsStateHandler.controller.value++;
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  PaymentSystem getSystemById(int id) {
    return _systems.firstWhere((element) => element.id == id);
  }

  void editSystem(PaymentSystem system) {
    final index = _systems.indexWhere((element) => element.id == system.id);

    try {
      apiRepository.updatePaymentSystem(system.toJson());
      _systems[index] = system;
      PaymentSystemsStateHandler.controller.value++;
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  void init() async {
    _systems.clear();
    PaymentSystemsStateHandler.controller.value--;
    preloadSystems();
  }

  final List<PaymentSystem> _systems = [];
}

void preloadSystems() async {
  Response response = await apiRepository.getPaymentSystems();
  if (response.statusCode == 200) {
    final data = response.data["\$values"] as List<dynamic>;

    for (final system in data) {
      PaymentSystemsStateHandler.instance
          .addSystem(PaymentSystem.fromJson(system as Map<String, dynamic>));
      PaymentSystemsStateHandler.controller.value++;
    }
  }
}
