// ignore_for_file: empty_catches

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
      } else if (response.statusCode == 401) {
        String error = 'Something went wrong';
        if (response.data != null &&
            response.data['error'] == 'Invalid username or password') {
          error = 'Invalid username or password';
        }
        throw Exception(error);
      } else {
        log("Failed to create user: ${response.statusCode}");
      }
    } on DioException {
      rethrow;
    }
  }
}
