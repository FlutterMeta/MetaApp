import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

import '../../core/global.dart';
import '../../data/models/product.dart';
import '../../data/models/result.dart';

class ProductsNotifier extends ChangeNotifier {
  final List<Product> _products = [];
  List<Product> get products => _products;

  Future<Result> loadProducts() async {
    try {
      Response response = await apiRepository.getProducts();
      if (response.statusCode == 200) {
        final data = response.data["\$values"] as List<dynamic>;

        _products.clear();
        for (final productData in data) {
          Product product =
              Product.fromJson(productData as Map<String, dynamic>);
          _products.add(product);
        }
        notifyListeners();
        return Result.success();
      } else {
        return Result.failure(message: response.data["title"]?.toString());
      }
    } catch (e) {
      debugPrint(e.toString());
      return Result.failure(message: e.toString());
    }
  }

  Future<Result> addProduct(Product product) async {
    try {
      Response response = await apiRepository.createProduct(product.toJson());
      if (response.statusCode == 200) {
        _products.add(product);
        notifyListeners();
        return Result.success();
      } else {
        return Result.failure(message: response.data["title"]?.toString());
      }
    } catch (e) {
      debugPrint(e.toString());
      return Result.failure(message: e.toString());
    }
  }

  Future<Result> editProduct(Product product) async {
    try {
      Response response =
          await apiRepository.updateProduct(product.id, product.toJson());
      if (response.statusCode == 200) {
        final index = products.indexWhere((p) => p.id == product.id);
        products[index] = product;
        notifyListeners();
        return Result.success();
      } else {
        return Result.failure(message: response.data["title"]?.toString());
      }
    } catch (e) {
      debugPrint(e.toString());
      return Result.failure(message: e.toString());
    }
  }

  Future<Result> deleteProduct(int productId) async {
    try {
      Response response = await apiRepository.deleteProduct(productId);
      if (response.statusCode == 200) {
        _products.removeWhere((product) => product.id == productId);
        notifyListeners();
        return Result.success();
      } else {
        return Result.failure(message: response.data["title"]?.toString());
      }
    } catch (e) {
      debugPrint(e.toString());
      return Result.failure(message: e.toString());
    }
  }
}
