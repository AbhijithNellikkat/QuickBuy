import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:quick_buy/app/models/users_model.dart';
import 'package:quick_buy/app/utils/api_url.dart';

class SignUpService {
  final Dio dio = Dio();

  Future<void> createUser({required Users user}) async {
    try {
      var data = {
        "name": user.name,
        "email": user.email,
        "password": user.password,
        "avatar": user.avatar
      };

      var response = await dio.post(
        usersUrl,
        data: jsonEncode(data),
        options: Options(
          headers: {'Content-Type': 'application/json'},
        ),
      );

      if (response.statusCode == 201) {
        log("User Created");
      } else {
        log("Failed to create user: ${response.statusCode}");
      }
    } catch (e) {
      log("Error: $e");
    }
  }
}
