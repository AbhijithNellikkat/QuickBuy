import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:quick_buy/app/services/userside_categories_service.dart';

class UserCategoryController extends ChangeNotifier {
  bool loading = false;

  List<dynamic> categories = [];

  List<dynamic> productsByCategory = [];

  final UserSideCategoryService userSideCategoryService =
      UserSideCategoryService();

  Future<void> fetchAllCategories() async {
    try {
      loading = true;
      notifyListeners();

      categories = await userSideCategoryService.fetchAllCategories();

      log("Categories datas length in user side  : ${categories.length}");

      loading = false;
      notifyListeners();
    } catch (e) {
      loading = false;
      notifyListeners();
      log('$e');
    }
  }

  Future<void> fetchAllProductsByCategory(categoryId) async {
    try {
      loading = true;
      notifyListeners();

      productsByCategory =
          await userSideCategoryService.fetchAllProductsByCategory(categoryId);

      loading = false;
      notifyListeners();
    } catch (e) {
      loading = false;
      notifyListeners();
      log('$e');
    }
  }
}
