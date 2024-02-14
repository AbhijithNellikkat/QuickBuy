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

  Future<void> createNewProduct({required ProductsModel productsModel}) async {
    try {
      loading = true;
      notifyListeners();

      await productsService.createNewProduct(productsModel: productsModel);
      await fetchAllProducts();
    } catch (e) {
      loading = false;
      notifyListeners();
      log('$e');
    }
  }
}
