import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:quick_buy/app/models/products_model.dart';

class ProductsFilterService {
  final Dio dio = Dio();

  Future<List<dynamic>> filterByTitle({required String title}) async {
    try {
      final response = await dio
          .get("https://api.escuelajs.co/api/v1/products/?title=$title");
      if (response.statusCode == 200) {
        log("Filter by title is successfully");
        final List<dynamic> filteredProducts = (response.data)
            .map((product) => ProductsModel.fromJson(product))
            .toList();
        return filteredProducts;
      } else {
        throw Exception('Failed to load the Filtered products');
      }
    } catch (e) {
      log("Error : $e");
      rethrow;
    }
  }

  Future<List<dynamic>> filterByPrice({required dynamic price}) async {
    try {
      final response = await dio
          .get("https://api.escuelajs.co/api/v1/products/?price=$price");
      if (response.statusCode == 200) {
        log("Filter by price is successfully");
        final List<dynamic> filteredProducts = (response.data)
            .map((product) => ProductsModel.fromJson(product))
            .toList();
        return filteredProducts;
      } else {
        throw Exception('Failed to load the Filtered products');
      }
    } catch (e) {
      log("Error : $e");
      rethrow;
    }
  }
}
