import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:quick_buy/app/services/products_filter_service.dart';
import 'package:quick_buy/app/services/userside_products_service.dart';

class ProductsFilterController extends ChangeNotifier {
  final ProductsFilterService productsFilterService = ProductsFilterService();
  final UserSideProductsService userSideProductsService =
      UserSideProductsService();

  bool loading = false;
  List<dynamic> filteredProducts = [];

  Future<void> fetchAllFilterByTitleProducts({required String title}) async {
    try {
      loading = true;
      notifyListeners();

      filteredProducts.clear();

      filteredProducts =
          await productsFilterService.filterByTitle(title: title);

      log("filteredProducts datas length  : ${filteredProducts.length}");

      loading = false;
      notifyListeners();
    } catch (e) {
      loading = false;
      notifyListeners();
      log('Error : $e');
    }
  }

   Future<void> fetchAllFilterByPriceProducts({required dynamic price}) async {
    try {
      loading = true;
      notifyListeners();

      filteredProducts.clear();

      filteredProducts =
          await productsFilterService.filterByPrice(price: price);

      log("filteredProducts datas length  : ${filteredProducts.length}");

      loading = false;
      notifyListeners();
    } catch (e) {
      loading = false;
      notifyListeners();
      log('Error : $e');
    }
  }

  Future<void> fetchAllProducts() async {
    try {
      loading = true;
      notifyListeners();

      filteredProducts.clear();

      filteredProducts = await userSideProductsService.fetchAllProducts();

      log("all products  datas length  : ${filteredProducts.length}");

      loading = false;
      notifyListeners();
    } catch (e) {
      loading = false;
      notifyListeners();
      log('Error : $e');
    }
  }
}
