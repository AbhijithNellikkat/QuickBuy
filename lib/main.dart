import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quick_buy/app/controllers/adminside_categories_controller.dart';
import 'package:quick_buy/app/controllers/adminside_products_controller.dart';
import 'package:quick_buy/app/controllers/bottomNavigationBar_controller.dart';
import 'package:quick_buy/app/controllers/login_controller.dart';
import 'package:quick_buy/app/controllers/userside_categories_controller.dart';
import 'package:quick_buy/app/controllers/userside_products_controller.dart';

import 'app/controllers/signup_controller.dart';
import 'app/views/users/auth/signup/signup_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => SignUpController()),
        ChangeNotifierProvider(create: (context) => LoginController()),
        ChangeNotifierProvider(create: (context) => AdminCategoryController()),
        ChangeNotifierProvider(create: (context) => AdminProductsController()),
        ChangeNotifierProvider(
            create: (context) => BottomNavigationBarController()),
            ChangeNotifierProvider(
            create: (context) => UserCategoryController()),
              ChangeNotifierProvider(
            create: (context) => UserProductsController()),
      ],
      child: MaterialApp(
        title: 'QuickBuy',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          appBarTheme: const AppBarTheme(backgroundColor: Colors.black),
          colorScheme: ColorScheme.fromSeed(
            seedColor: Colors.yellow,
          ),
          useMaterial3: true,
        ),
        home: SignUpView(),
        // home: AdminView(),
      ),
    );
  }
}
