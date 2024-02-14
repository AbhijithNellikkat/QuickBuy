import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:quick_buy/app/models/products_model.dart';
import 'package:quick_buy/app/utils/api_url.dart';

class ProductsService {
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

  Future<void> createNewProduct({required ProductsModel productsModel}) async {
    var url = "https://api.escuelajs.co/api/v1/products/";
    try {
      var data = {
        "title": productsModel.title,
        "price": productsModel.price,
        "description": productsModel.description,
        "categoryId": productsModel.category!.id,
        "images": productsModel.images
      };

      var response = await dio.post(
        url,
        data: jsonEncode(data),
        options: Options(
          headers: {'Content-Type': 'application/json'},
        ),
      );

      if (response.statusCode == 201) {
        await fetchAllProducts();
        log("Add new product successfully");
      }
    } catch (e) {
      log("Error : $e");
      rethrow;
    }
  }
}
