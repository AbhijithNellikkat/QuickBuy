import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quick_buy/app/controllers/categories_controller.dart';
import 'package:quick_buy/app/controllers/login_controller.dart';
import 'package:quick_buy/app/controllers/products_controller.dart';
import 'package:quick_buy/app/utils/constants.dart';
import 'package:quick_buy/app/views/admin/admin_view.dart';

import 'app/controllers/signup_controller.dart';

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
        ChangeNotifierProvider(create: (context) => CategoryController()),
        ChangeNotifierProvider(create: (context) => ProductsController()),
      ],
      child: MaterialApp(
        title: 'QuickBuy',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          appBarTheme: const AppBarTheme(backgroundColor: kBlack),
          colorScheme: ColorScheme.fromSeed(
            seedColor: Colors.yellow,
          ),
          useMaterial3: true,
        ),
        // home: SignUpView(),
        home: AdminView(),
      ),
    );
  }
}
