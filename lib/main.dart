import 'package:flutter/material.dart';
import 'package:quick_buy/app/utils/constants.dart';
import 'package:quick_buy/app/views/admin/admin_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'QuickBuy',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          appBarTheme: const AppBarTheme(backgroundColor: kBlack),
          colorScheme: ColorScheme.fromSeed(
            seedColor: Colors.yellow,
          ),
          useMaterial3: true,
        ),
        home: AdminView());
  }
}
