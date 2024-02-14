import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:quick_buy/app/services/userside_products_service.dart';

class UserProductsController extends ChangeNotifier {
  bool loading = false;
  List<dynamic> products = [];

  final UserSideProductsService userSideProductsService =
      UserSideProductsService();

  Future<void> fetchAllProducts() async {
    try {
      loading = true;
      notifyListeners();

      products = await userSideProductsService.fetchAllProducts();

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
