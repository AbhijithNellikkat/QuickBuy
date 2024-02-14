// ignore_for_file: file_names

import 'package:flutter/material.dart';

class BottomNavigationBarController extends ChangeNotifier {
  var tabIndex = 0;
    void changeTabIndex(int index) {
    tabIndex = index;
    notifyListeners();
  }
}
