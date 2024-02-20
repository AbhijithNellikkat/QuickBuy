import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:quick_buy/app/models/products_model.dart';
import 'package:quick_buy/app/utils/api_url.dart';

class ProductsService {
  final Dio dio = Dio();

  Future<List<ProductsModel>> fetchAllProducts() async {
    try {
      final response = await dio.get(productsUrl);

      if (response.statusCode == 200) {
        log("Products data fetching successful");
        final List<dynamic> responseData = response.data;
        final List<ProductsModel> products = responseData
            .map((product) => ProductsModel.fromJson(product))
            .toList();
        return products;
      } else {
        throw Exception('Failed to load Products');
      }
    } catch (e) {
      log("Error: $e");
      rethrow;
    }
  }

  static const String baseUrl = 'https://api.escuelajs.co/api/v1/products/';

   Future<bool> createProduct(ProductsModel product) async {
    try {
      final response = await dio.post(
        baseUrl,
        data: productsModelToJson([product]),
        options: Options(
          headers: {
            'Content-Type': 'application/json; charset=UTF-8',
          },
        ),
      );

      if (response.statusCode == 201) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      log("Error creating product: $e");
      return false;
    }
  }
}
