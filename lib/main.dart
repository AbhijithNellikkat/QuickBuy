// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quick_buy/app/controllers/adminside_categories_controller.dart';
import 'package:quick_buy/app/controllers/adminside_products_controller.dart';
import 'package:quick_buy/app/controllers/bottomNavigationBar_controller.dart';
import 'package:quick_buy/app/controllers/login_controller.dart';
import 'package:quick_buy/app/controllers/products_filter_controller.dart';
import 'package:quick_buy/app/controllers/userside_categories_controller.dart';
import 'package:quick_buy/app/controllers/userside_products_controller.dart';
import 'package:quick_buy/app/views/users/home/bottom_navigationbar.dart';

import 'app/controllers/signup_controller.dart';
import 'app/services/login_service.dart';
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
        ChangeNotifierProvider(create: (context) => UserCategoryController()),
        ChangeNotifierProvider(create: (context) => UserProductsController()),
        ChangeNotifierProvider(create: (context) => ProductsFilterController()),
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
        home: AppStartUpView(),
        // home: AdminView(),
      ),
    );
  }
}

class AppStartUpView extends StatefulWidget {
  const AppStartUpView({super.key});

  @override
  State<AppStartUpView> createState() => _AppStartUpViewState();
}

class _AppStartUpViewState extends State<AppStartUpView> {
  bool loading = true;
  @override
  void initState() {
    super.initState();
    checkLoginStatus();
  }

  Future<void> checkLoginStatus() async {
    final loginService = LoginService();
    final accessToken = await loginService.getAccessToken();

    if (accessToken != null) {
      Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) => const BottomNavigationBarWidget()));
    } else {
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => SignUpView()));
    }

    setState(() {
      loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return loading ? const CircularProgressIndicator() : Container();
  }
}
