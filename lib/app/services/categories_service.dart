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
      } else if (response.statusCode == 401) {
        throw Exception('Unauthorized access: ${response.statusCode}');
      } else {
        throw Exception('Failed to load categories: ${response.statusCode}');
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
      var data = {
        "name": categoriesModel.name,
        "image": categoriesModel.image,
      };

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
      } else if (response.statusCode == 401) {
        throw Exception('Unauthorized access: ${response.statusCode}');
      } else {
        throw Exception('Failed to create category: ${response.statusCode}');
      }
    } catch (e) {
      log("Error : $e");
      rethrow;
    }
  }
}
