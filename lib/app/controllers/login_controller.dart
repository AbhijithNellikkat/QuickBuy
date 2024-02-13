// ignore_for_file: deprecated_member_use, use_build_context_synchronously

import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:quick_buy/app/models/users_model.dart';
import 'package:quick_buy/app/services/login_service.dart';
import 'package:quick_buy/app/views/users/home/home_view.dart';

class LoginController extends ChangeNotifier {
  bool loading = false;

  final LoginService loginService = LoginService();

  Future<void> loginUser(
      {required Users user, required BuildContext cxt}) async {
    try {
      loading = true;
      notifyListeners();

      String? accessToken = await loginService.loginUser(user: user);
      log("adsfasdf : $accessToken");

      // ignore: unnecessary_null_comparison
      if (accessToken != null) {
        
        await loginService.fetchUserProfile(accessToken);

        Navigator.pushReplacement(
            cxt, MaterialPageRoute(builder: (context) => HomeView()));
      } else {
        ScaffoldMessenger.of(cxt)
            .showSnackBar(const SnackBar(content: Text('Failed to login')));
      }
      log("Login Successfully!!!");
    } on DioError catch (e) {
      if (e.response != null && e.response!.statusCode == 401) {
        ScaffoldMessenger.of(cxt).showSnackBar(const SnackBar(
            backgroundColor: Colors.red,
            content: Text('Incorrect email or password')));
      } else {
        log('DioError: $e');
        ScaffoldMessenger.of(cxt).showSnackBar(const SnackBar(
            backgroundColor: Colors.red,
            content: Text('Failed to login. Please try again later')));
      }
    } catch (e) {
      log('Error during login: $e');
      ScaffoldMessenger.of(cxt).showSnackBar(const SnackBar(
          backgroundColor: Colors.red,
          content: Text('Failed to login. Please try again later')));
    }
  }
}
