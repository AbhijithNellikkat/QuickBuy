import 'package:flutter/material.dart';
import 'package:quick_buy/app/utils/constants.dart';

class CategoriesView extends StatelessWidget {
  const CategoriesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: kWhite),
        title: const Text(
          "Categories",
          style: TextStyle(color: kWhite),
        ),
      ),
    );
  }
}
