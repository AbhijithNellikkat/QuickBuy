import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quick_buy/app/utils/constants.dart';
import 'package:quick_buy/app/views/admin/categories/views/categories_view.dart';
import 'package:quick_buy/app/views/admin/dashboard/views/dashboard_view.dart';
import 'package:quick_buy/app/views/admin/products/views/products_view.dart';
import 'package:quick_buy/app/views/admin/users/views/user_view.dart';

class AdminView extends StatelessWidget {
  const AdminView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          iconTheme: const IconThemeData(color: kWhite),
          title: Text(
            "Quick Buy",
            style: GoogleFonts.poppins(color: kWhite),
          ),
          centerTitle: true,
        ),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              DrawerHeader(
                child: Text(
                  "Quick Buy",
                  style: GoogleFonts.poppins(
                      fontSize: 22, fontWeight: FontWeight.bold),
                ),
              ),
              Card(
                elevation: 5,
                margin: const EdgeInsets.symmetric(horizontal: 10),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 20, horizontal: 5),
                  child: ListTile(
                    title: const Text("Dashboard "),
                    leading: const Icon(Icons.dashboard),
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const DashboardView(),
                      ));
                    },
                    trailing: IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.arrow_right),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 30),
              Card(
                elevation: 5,
                margin: const EdgeInsets.symmetric(horizontal: 10),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 20, horizontal: 5),
                  child: ListTile(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const UsersView(),
                      ));
                    },
                    title: const Text("Users "),
                    leading: const Icon(Icons.people_alt_rounded),
                    trailing: IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.arrow_right),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 30),
              Card(
                elevation: 5,
                margin: const EdgeInsets.symmetric(horizontal: 10),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 20, horizontal: 5),
                  child: ListTile(
                    title: const Text("Categories"),
                    leading: const Icon(Icons.category),
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const CategoriesView(),
                      ));
                    },
                    trailing: IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.arrow_right),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 30),
              Card(
                elevation: 5,
                margin: const EdgeInsets.symmetric(horizontal: 10),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 20, horizontal: 5),
                  child: ListTile(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const ProductsView(),
                      ));
                    },
                    title: const Text("Products"),
                    leading: const Icon(Icons.dataset),
                    trailing: IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.arrow_right),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
