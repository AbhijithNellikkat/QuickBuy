import 'package:flutter/material.dart';
import 'package:quick_buy/app/utils/constants.dart';

class DashboardView extends StatelessWidget {
  const DashboardView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        
        iconTheme: const IconThemeData(color: kWhite),
        title: const Text(
          "Dashboard",
          style: TextStyle(color: kWhite),
        ),
      ),
    );
  }
}
