import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:quick_buy/app/models/users_model.dart';
import 'package:quick_buy/app/services/signup_service.dart';

class SignUpController extends ChangeNotifier {
  final SignUpService signUpService = SignUpService();

  bool loading = false;

  Future<void> createUser({required Users user}) async {
    try {
      loading = true;
      notifyListeners();

      await signUpService.createUser(user: user);
      log("done");
    } catch (e) {
      loading = false;
      notifyListeners();
      log("signup controller Error : $e");
    }
  }
}
