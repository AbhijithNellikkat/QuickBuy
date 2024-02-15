import 'package:clay_containers/clay_containers.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:quick_buy/app/controllers/login_controller.dart';
import 'package:quick_buy/app/utils/constants.dart';
import 'package:quick_buy/app/views/admin/categories/views/categories_view.dart';
import 'package:quick_buy/app/views/admin/dashboard/views/dashboard_view.dart';
import 'package:quick_buy/app/views/admin/products/views/products_view.dart';
import 'package:quick_buy/app/views/admin/users/views/user_view.dart';

class AdminView extends StatelessWidget {
  const AdminView({super.key});

  @override
  Widget build(BuildContext context) {
    Color baseColor = const Color(0xFFF2F2F2);

    List<IconData> icons = [
      Icons.dashboard,
      Icons.people,
      Icons.category,
      Icons.shopping_cart,
    ];
    List<Widget> routes = [
      const DashboardView(),
      const UsersView(),
      const CategoriesView(),
      const ProductsView(),
    ];
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          actions: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: IconButton(
                icon: const Icon(Icons.logout),
                onPressed: () {
                  Provider.of<LoginController>(context, listen: false)
                      .logoutUser(context);
                },
              ),
            ),
          ],
          iconTheme: const IconThemeData(color: kWhite),
          title: Text(
            "Quick Buy",
            style: GoogleFonts.poppins(color: kWhite),
          ),
        ),
        body: ListView(
          children: [
            Center(
              child: SizedBox(
                width: double.infinity,
                height: 310,
                child: Lottie.asset(
                  "assets/animations/Animation - 1707988788092.json",
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                ),
                itemCount: icons.length,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) => GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => routes[index],
                    ));
                  },
                  child: Container(
                    color: baseColor,
                    child: Center(
                      child: ClayContainer(
                        borderRadius: 10,
                        depth: 65,
                        color: baseColor,
                        height: 150,
                        width: 150,
                        child: Icon(
                          icons[index],
                          size: 40,
                          color: const Color.fromARGB(255, 25, 95, 107),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
