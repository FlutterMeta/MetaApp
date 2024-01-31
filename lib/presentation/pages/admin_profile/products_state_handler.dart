import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

import '../../../core/global.dart';
import '../../../data/models/product.dart';

class ProductsStateHandler {
  static ProductsStateHandler get instance => _singleton;
  static final ProductsStateHandler _singleton =
      ProductsStateHandler._internal();
  ProductsStateHandler._internal();

  // If controller value changes, the Product page will rebuild
  static final ValueNotifier<int> _controller = ValueNotifier(0);
  static ValueNotifier<int> get controller => _controller;

  List<Product> get products => _products;
  void add(Product product) => _products.add(product);
  void remove(Product product) =>
      _products.removeWhere((element) => element.id == product.id);
  void edit(Product product) {
    final index = _products.indexWhere((element) => element.id == product.id);
    _products[index] = product;
  }

  void init() async {
    _products.clear();
    load();
    ProductsStateHandler.controller.value++;
  }

  void load() async {
    Response response = await apiRepository.getProducts();
    if (response.statusCode == 200) {
      final data = response.data["\$values"] as List<dynamic>;
      for (final product in data) {
        try {
          ProductsStateHandler.instance
              .add(Product.fromJson(product as Map<String, dynamic>));
          ProductsStateHandler.controller.value++;
        } catch (e) {
          debugPrint(e.toString());
        }
      }
    }
  }

  final List<Product> _products = [];
}
