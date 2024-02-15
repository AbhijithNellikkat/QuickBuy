// ignore_for_file: deprecated_member_use

import 'dart:convert';
import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:quick_buy/app/models/users_model.dart';
import 'package:quick_buy/app/utils/api_url.dart';

class LoginService {
  final Dio dio = Dio();

  Future<String> loginUser({required Users user}) async {
    try {
      var data = {"email": user.email, "password": user.password};

      var response = await dio.post(
        loginUrl,
        data: jsonEncode(data),
        options: Options(
          headers: {'Content-Type': 'application/json'},
        ),
      );

      log("token : ${response.data['access_token']}");

      if (response.statusCode == 201) {
        String accessToken = response.data['access_token'];
        await _saveAccessToken(accessToken);
        return accessToken;
      } else if (response.statusCode == 401) {
        String error = 'Something went wrong';
        if (response.data != null &&
            response.data['error'] == 'Invalid username or password') {
          error = 'Invalid username or password';
        }
        throw Exception(error);
      } else {
        log('Failed to login: ${response.statusCode}');
        return '';
      }
    } on DioException {
      rethrow;
    }
  }

  Future<void> fetchUserProfile(String accessToken) async {
    try {
      var response = await dio.get(
        profileUrl,
        options: Options(
          headers: {'Authorization': 'Bearer $accessToken'},
        ),
      );

      if (response.statusCode == 200) {
        var profileData = jsonDecode(response.data);
        log('Profile data: $profileData');
      } else {
        log('Failed to fetch profile: ${response.statusCode}');
      }
    } on DioError catch (e) {
      if (e.response != null) {
        log('DioException Response Data: ${e.response!.data}');
        log('DioException Response Status: ${e.response!.statusCode}');
      } else {
        log('DioException: $e');
      }
    } catch (e) {
      log('Error fetching profile: $e');
    }
  }

  Future<void> _saveAccessToken(String token) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('access_token', token);
  }

  Future<String?> getAccessToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('access_token');
  }

  Future<void> clearAccessToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('access_token');
  }
}
