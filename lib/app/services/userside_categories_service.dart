import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:quick_buy/app/models/categories_model.dart';
import 'package:quick_buy/app/models/getallproductsbycategory_model.dart';
import 'package:quick_buy/app/utils/api_url.dart';

class UserSideCategoryService {
  final Dio dio = Dio();

  Future<List<dynamic>> fetchAllCategories() async {
    try {
      final response = await dio.get(categoriesUrl);

      if (response.statusCode == 200) {
        log("Categories data fetching successfully in user side ");
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

  Future<List<dynamic>> fetchAllProductsByCategory(categoryId) async {
    try {

      
      final response = await dio.get("https://api.escuelajs.co/api/v1/categories/$categoryId/products");

      if (response.statusCode == 200) {
        log("Categories data fetching successfully in user side ");
        final List<dynamic> productsByCategory = (response.data)
            .map((category) => AllProductsByCategoryModel.fromJson(category))
            .toList();

        return productsByCategory;
      } else {
        throw Exception('Failed to load productsByCategory');
      }
    } catch (e) {
      log("Error : $e");
      rethrow;
    }
  }
}
