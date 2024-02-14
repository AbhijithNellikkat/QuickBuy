import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:quick_buy/app/utils/constants.dart';
import 'package:quick_buy/app/views/admin/admin_view.dart';
import 'package:quick_buy/app/views/users/categories/view/productsByCategory_view.dart';
import 'package:quick_buy/app/views/users/categories/widgets/category_widget.dart';
import 'package:quick_buy/app/views/users/home/widgets/sale_widget.dart';

import '../../../controllers/userside_categories_controller.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  void initState() {
    Provider.of<UserCategoryController>(context, listen: false)
        .fetchAllCategories();
    Provider.of<UserCategoryController>(context, listen: false)
        .fetchAllFurnituresProducts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final userCategoryController = Provider.of<UserCategoryController>(context);
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => AdminView(),
                ));
              },
              icon: Icon(Icons.admin_panel_settings),
            ),
          )
        ],
        automaticallyImplyLeading: false,
        iconTheme: const IconThemeData(color: kWhite),
        title: Text(
          "Quick Buy",
          style:
              GoogleFonts.poppins(color: kWhite, fontWeight: FontWeight.w200),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(11.0),
          child: Column(
            children: [
              const SizedBox(height: 18),
              TextField(
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                    hintText: 'Search',
                    filled: true,
                    fillColor: Theme.of(context).cardColor,
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(
                          color: Color.fromARGB(255, 82, 82, 82)),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(
                          color: Color.fromARGB(255, 32, 125, 248)),
                    ),
                    suffixIcon: const Icon(Icons.search)),
              ),
              const SizedBox(height: 18),
              SizedBox(
                height: size.height * 0.25,
                child: Swiper(
                  itemCount: 3,
                  itemBuilder: (ctx, index) {
                    return const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: SaleWidget(),
                    );
                  },
                  autoplay: true,
                  pagination: const SwiperPagination(
                    alignment: Alignment.bottomCenter,
                    builder: DotSwiperPaginationBuilder(
                        color: Colors.white, activeColor: Colors.red),
                  ),
                  // control: const SwiperControl(),
                ),
              ),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Text(
                      "All Categories",
                      style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w400, fontSize: 20),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 8),
              SizedBox(
                height: size.height * 0.22,
                child: GridView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: userCategoryController.categories.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 1,
                  ),
                  itemBuilder: (context, index) {
                    final category = userCategoryController.categories[index];
                    if (userCategoryController.loading) {
                      return const Center(
                        child: SpinKitFadingCircle(
                          color: kBlack,
                          size: 50.0,
                        ),
                      );
                    } else {
                      return GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => ProductsByCategoryView(
                              categoryId: category.id,
                            ),
                          ));
                        },
                        child: CategoryWidget(
                            categoryImage: category.image,
                            categoryname: category.name),
                      );
                    }
                  },
                ),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Text(
                      "Furnitures",
                      style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w400, fontSize: 20),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              SizedBox(
                height: size.height * 0.29,
                child: GridView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: userCategoryController
                      .fetchAllFurnituresProductsList.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      mainAxisSpacing: 20, crossAxisCount: 1),
                  itemBuilder: (context, index) {
                    final product = userCategoryController
                        .fetchAllFurnituresProductsList[index];

                    if (userCategoryController.loading) {
                      return const Center(
                        child: SpinKitFadingCircle(
                          color: kBlack,
                          size: 50.0,
                        ),
                      );
                    } else {
                      return SizedBox(
                        width: 150,
                        height: 260,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: double.infinity,
                              height: 170,
                              decoration: BoxDecoration(
                                boxShadow: const [
                                  BoxShadow(
                                    color: Color.fromARGB(255, 0, 0, 0),
                                    blurRadius: 6,
                                    blurStyle: BlurStyle.inner,
                                    offset: Offset(
                                      4.0,
                                      4.0,
                                    ),
                                  ),
                                ],
                                borderRadius: BorderRadius.circular(22),
                                image: DecorationImage(
                                  image: NetworkImage(
                                    product.images?[0] ??
                                        "https://t3.ftcdn.net/jpg/05/04/28/96/360_F_504289605_zehJiK0tCuZLP2MdfFBpcJdOVxKLnXg1.jpg",
                                  ),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                product.title ?? '',
                                maxLines: 1,
                                softWrap: true,
                                overflow: TextOverflow.ellipsis,
                                style: GoogleFonts.poppins(
                                    fontWeight: FontWeight.bold, fontSize: 14),
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8.0),
                              child: Text(
                                "\$${product.price}",
                                style: const TextStyle(
                                  fontSize: 14,
                                  color: Colors.green,
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    }
                  },
                ),
              ),
              const SizedBox(height: 30)
            ],
          ),
        ),
      ),
    );
  }
}
