// CategoriesController
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:quick_buy/app/models/categories_model.dart';
import 'package:quick_buy/app/services/adminside_categories_service.dart';

class AdminCategoryController extends ChangeNotifier {
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

  Future<void> createNewCategory(
      {required CategoriesModel categoriesModel}) async {
    try {
      loading = true;
      notifyListeners();

      await categoryService.createNewCategory(categoriesModel: categoriesModel);
      await fetchAllCategories();
    } catch (e) {
      loading = false;
      notifyListeners();
      log('$e');
    }
  }

  Future<bool> deleteCategory({required dynamic categoryID}) async {
    try {
      loading = true;
      notifyListeners();

      bool deleted =
          await categoryService.deleteCategory(categoryID: categoryID);
      if (deleted) {
        await fetchAllCategories();
      }
      loading = false;
      notifyListeners();
      return deleted;
    } catch (e) {
      loading = false;
      notifyListeners();
      log('$e');
      return false;
    }
  }

  Future<void> updateCategory(
      {required int categoryId,
      required CategoriesModel categoriesModel}) async {
    try {
      loading = true;
      notifyListeners();
      bool updated = await categoryService.updateCategory(
          categoryId: categoryId, categoriesModel: categoriesModel);
      if (updated) {
        await fetchAllCategories();
      }
    } catch (e) {
      log("Error updating category: $e");
    } finally {
      loading = false;
      notifyListeners();
    }
  }
}
