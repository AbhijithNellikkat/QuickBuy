import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:quick_buy/app/models/products_model.dart';
import 'package:quick_buy/app/utils/api_url.dart';

class UserSideProductsService {
  final Dio dio = Dio();

  Future<List<dynamic>> fetchAllProducts() async {
    try {
      final response = await dio.get(productsUrl);

      if (response.statusCode == 200) {
        log("products data fetching successfully ");
        final List<dynamic> products = (response.data)
            .map((product) => ProductsModel.fromJson(product))
            .toList();
        return products;
      } else {
        throw Exception('Failed to load Products');
      }
    } catch (e) {
      log("Error : $e");
      rethrow;
    }
  }
}
