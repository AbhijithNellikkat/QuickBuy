import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import 'package:quick_buy/app/models/users_model.dart';
import 'package:quick_buy/app/services/login_service.dart';
import 'package:quick_buy/app/views/admin/admin_view.dart';
import 'package:quick_buy/app/views/users/auth/login/login_view.dart';
import 'package:quick_buy/app/views/users/home/bottom_navigationbar.dart';


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

      if (accessToken != null) {
        await loginService.fetchUserProfile(accessToken);

        if (user.email == 'admin666@gmail.com' && user.password == 'admin666') {
          Navigator.pushReplacement(
            cxt,
            MaterialPageRoute(builder: (context) => AdminView()),
          );
        } else {
          Navigator.pushReplacement(
            cxt,
            MaterialPageRoute(
                builder: (context) => BottomNavigationBarWidget()),
          );
        }
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

   void logoutUser(BuildContext context) {
    loginService.clearAccessToken();
    // Navigate to Login Screen
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => LoginView()),
    );
  }
}
