import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

import '../../core/global.dart';
import '../../data/models/product.dart';

class ProductsNotifier extends ChangeNotifier {
  final List<Product> _products = [];
  List<Product> get products => _products;

  Future<void> loadProducts() async {
    try {
      Response response = await apiRepository.getProducts();
      if (response.statusCode == 200) {
        final data = response.data["\$values"] as List<dynamic>;

        for (final productData in data) {
          Product product =
              Product.fromJson(productData as Map<String, dynamic>);
          _products.add(product);
        }
        notifyListeners();
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  Future<void> addProduct(Product product) async {
    try {
      Response response = await apiRepository.createProduct(product.toJson());
      if (response.statusCode == 200) {
        _products.add(product);
        notifyListeners();
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  Future<void> editProduct(Product product) async {
    try {
      Response response =
          await apiRepository.updateProduct(product.id, product.toJson());
      if (response.statusCode == 200) {
        final index =
            _products.indexWhere((element) => element.id == product.id);
        _products[index] = product;
        notifyListeners();
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  Future<void> deleteProduct(int productId) async {
    try {
      Response response = await apiRepository.deleteProduct(productId);
      if (response.statusCode == 200) {
        _products.removeWhere((product) => product.id == productId);
        notifyListeners();
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
