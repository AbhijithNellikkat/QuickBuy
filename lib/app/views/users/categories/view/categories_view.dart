import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:quick_buy/app/controllers/userside_categories_controller.dart';
import 'package:quick_buy/app/utils/constants.dart';
import 'package:quick_buy/app/views/users/categories/view/productsByCategory_view.dart';
import 'package:quick_buy/app/views/users/categories/widgets/category_widget.dart';

class CategoriesView extends StatefulWidget {
  const CategoriesView({Key? key}) : super(key: key);

  @override
  State<CategoriesView> createState() => _CategoriesViewState();
}

class _CategoriesViewState extends State<CategoriesView> {
  @override
  void initState() {
    super.initState();

    Provider.of<UserCategoryController>(context, listen: false)
        .fetchAllCategories();
  }

  Future<void> _refreshCategories() async {
    await Provider.of<UserCategoryController>(context, listen: false)
        .fetchAllCategories();
  }

  @override
  Widget build(BuildContext context) {
    final userCategoryController = Provider.of<UserCategoryController>(context);
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        iconTheme: const IconThemeData(color: kWhite),
        title: Text(
          "Categories",
          style: GoogleFonts.poppins(
            color: kWhite,
            fontWeight: FontWeight.w200,
          ),
        ),
      ),
      body: RefreshIndicator(
        onRefresh: _refreshCategories,
        child: userCategoryController.loading
            ? const Center(
                child: SpinKitFadingCircle(
                  color: kBlack,
                  size: 50.0,
                ),
              )
            : Padding(
                padding: const EdgeInsets.all(8.0),
                child: GridView.builder(
                  itemCount: userCategoryController.categories.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                  ),
                  itemBuilder: (context, index) {
                    final category = userCategoryController.categories[index];
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
                        categoryname: category.name,
                      ),
                    );
                  },
                ),
              ),
      ),
    );
  }
}
