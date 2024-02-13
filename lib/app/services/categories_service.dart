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
}
