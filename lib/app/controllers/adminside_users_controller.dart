import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:quick_buy/app/services/adminside_users_service.dart';

class AdminSideUsersController extends ChangeNotifier {
  bool loading = false;

  final AdminUsersService adminUsersService = AdminUsersService();

  List<dynamic> users = [];

  Future<void> fetchAllUsers() async {
    try {
      loading = true;
      notifyListeners();

      users = await adminUsersService.fetchAllUsers();

      log("Categories datas length  : ${users.length}");

      loading = false;
      notifyListeners();
    } catch (e) {
      loading = false;
      notifyListeners();
      log('$e');
    }
  }
}
