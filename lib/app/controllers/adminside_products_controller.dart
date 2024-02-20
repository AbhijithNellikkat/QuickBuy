import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:quick_buy/app/models/products_model.dart';

import 'package:quick_buy/app/services/adminside_products_serivce.dart';

class AdminProductsController extends ChangeNotifier {
  final ProductsService productsService = ProductsService();
  bool loading = false;
  List<dynamic> products = [];

  Future<void> fetchAllProducts() async {
    try {
      loading = true;
      notifyListeners();

      products = await productsService.fetchAllProducts();

      log("Products datas length  : ${products.length}");

      loading = false;
      notifyListeners();
    } catch (e) {
      loading = false;
      notifyListeners();
      log('Error : $e');
    }
  }

  Future<bool> createProduct(ProductsModel product) async {
    try {
      final bool success = await productsService.createProduct(product);
      return success;
    } catch (e) {
      print("Error creating product: $e");
      return false;
    }
  }
}
