import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:quick_buy/app/services/products_serivce.dart';

class ProductsController extends ChangeNotifier {
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
}
