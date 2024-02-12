import 'package:flutter/material.dart';
import 'package:quick_buy/app/utils/constants.dart';

class ProductsView extends StatelessWidget {
  const ProductsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
       
        iconTheme: const IconThemeData(color: kWhite),
        title: const Text(
          "Products",
          style: TextStyle(color: kWhite),
        ),
      ),
    );
  }
}
