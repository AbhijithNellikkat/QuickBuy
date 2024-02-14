import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:provider/provider.dart';
import 'package:quick_buy/app/views/users/categories/view/categories_view.dart';
import 'package:quick_buy/app/views/users/home/home_view.dart';
import 'package:quick_buy/app/views/users/products/view/products_view.dart';
import 'package:quick_buy/app/views/users/profile/view/profile_view.dart';

import '../../../controllers/bottomNavigationBar_controller.dart';

class BottomNavigationBarWidget extends StatelessWidget {
  const BottomNavigationBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final bottomNavigationBarController =
        Provider.of<BottomNavigationBarController>(context);

    return Scaffold(
      body: IndexedStack(
        index: bottomNavigationBarController.tabIndex,
        children: const [
          HomeView(),
          CategoriesView(),
          ProductsView(),
          ProfileView(),
        ],
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          // color: Colors.white,
          boxShadow: [
            BoxShadow(
              blurRadius: 20,
              color: Colors.black.withOpacity(.1),
            )
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
          child: GNav(
            // rippleColor: Colors.grey[300]!,
            // hoverColor: Colors.grey[100]!,
            gap: 8,
            // activeColor: Colors.black,
            iconSize: 24,
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
            duration: const Duration(milliseconds: 400),
            // tabBackgroundColor: Colors.grey[100]!,
            // color: Colors.black,
            tabs: const [
              GButton(
                icon: Icons.home,
                text: 'Home',
              ),
              GButton(
                icon: Icons.category,
                text: 'category',
              ),
              GButton(
                icon: Icons.dataset,
                text: 'products',
              ),
              GButton(
                icon: Icons.person_2_sharp,
                text: 'Profile',
              ),
            ],
            selectedIndex: bottomNavigationBarController.tabIndex,
            onTabChange: (index) {
              bottomNavigationBarController.changeTabIndex(index);
            },
          ),
        ),
      ),
    );
  }
}
