import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:quick_buy/app/models/categories_model.dart';
import 'package:quick_buy/app/utils/api_url.dart';

class CategoryService {
  final Dio dio = Dio();

  Future<List<dynamic>> fetchAllCategories() async {
    try {
      final response = await dio.get(categoriesUrl);

      if (response.statusCode == 200) {
        log("Categories data fetching successfully ");
        final List<dynamic> categories = (response.data)
            .map((category) => CategoriesModel.fromJson(category))
            .toList();

        return categories;
      } else {
        throw Exception('Failed to load categories');
      }
    } catch (e) {
      log("Error : $e");
      rethrow;
    }
  }

  Future<void> createNewCategory(
      {required CategoriesModel categoriesModel}) async {
    var url = "https://api.escuelajs.co/api/v1/categories/";
    try {
      var data = {"name": categoriesModel.name, "image": categoriesModel.image};

      var response = await dio.post(
        url,
        data: jsonEncode(data),
        options: Options(
          headers: {'Content-Type': 'application/json'},
        ),
      );

      if (response.statusCode == 201) {
        await fetchAllCategories();
        log("Add new category successfully");
      }
    } catch (e) {
      log("Error : $e");
      rethrow;
    }
  }

  Future<bool> deleteCategory({required dynamic categoryID}) async {
    try {
      final response = await dio
          .delete("https://api.escuelajs.co/api/v1/categories/$categoryID");

      if (response.statusCode == 200) {
        log("Category deleted successfully");
        return true;
      } else {
        throw Exception('Failed to delete category');
      }
    } catch (e) {
      log("Error: $e");
      rethrow;
    }
  }
}
