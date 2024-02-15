import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:quick_buy/app/models/users_model.dart';


class AdminUsersService {
  final Dio dio = Dio();


  Future<List<dynamic>>fetchAllUsers()async{
    try {
      final response = await dio.get("https://api.escuelajs.co/api/v1/users");

      if (response.statusCode == 200) {
        log("Users data fetching successfully ");
        final List<dynamic> users = (response.data)
            .map((user) => Users.fromJson(user))
            .toList();

        return users;
      } else {
        throw Exception('Failed to load Users');
      }
    } catch (e) {
      log("Error : $e");
      rethrow;
    }
  }

}
