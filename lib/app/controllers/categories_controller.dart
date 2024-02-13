// CategoriesController
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:quick_buy/app/services/categories_service.dart';

class CategoryController extends ChangeNotifier {
  bool loading = false;

  final CategoryService categoryService = CategoryService();

  List<dynamic> categories = [];

  Future<void> fetchAllCategories() async {
    try {
      loading = true;
      notifyListeners();

      categories = await categoryService.fetchAllCategories();

      log("Categories datas length  : ${categories.length}");

      loading = false;
      notifyListeners();
    } catch (e) {
      loading = false;
      notifyListeners();
      log('$e');
    }
  }
}
