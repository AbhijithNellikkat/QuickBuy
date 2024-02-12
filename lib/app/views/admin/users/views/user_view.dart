import 'package:flutter/material.dart';
import 'package:quick_buy/app/utils/constants.dart';

class UsersView extends StatelessWidget {
  const UsersView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: kWhite),
        
        title: const Text(
          "Users",
          style: TextStyle(color: kWhite),
        ),
      ),
    );
  }
}
