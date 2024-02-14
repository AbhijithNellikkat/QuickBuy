import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:quick_buy/app/controllers/userside_categories_controller.dart';
import 'package:quick_buy/app/utils/constants.dart';

class ProductsByCategoryView extends StatefulWidget {
  var categoryId;
   ProductsByCategoryView({Key? key, required this.categoryId}) : super(key: key);

  @override
  State<ProductsByCategoryView> createState() => _ProductsByCategoryViewState();
}

class _ProductsByCategoryViewState extends State<ProductsByCategoryView> {
  @override
  void initState() {
    super.initState();
    Provider.of<UserCategoryController>(context, listen: false)
        .fetchAllProductsByCategory(widget.categoryId);
  }

  @override
  Widget build(BuildContext context) {
    final userCategoryController = Provider.of<UserCategoryController>(context);
    return Scaffold(
      appBar: AppBar(
        // automaticallyImplyLeading: false,
        iconTheme: const IconThemeData(color: kWhite),
        title: Text(
          "Products By Category",
          style: GoogleFonts.poppins(
            color: kWhite,
            fontWeight: FontWeight.w200,
          ),
        ),
      ),
      body: userCategoryController.loading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              itemCount: userCategoryController.productsByCategory.length,
              itemBuilder: (context, index) {
                final product =
                    userCategoryController.productsByCategory[index];
                return ListTile(
                  title: Text(product.title ?? ''),
                  subtitle: Text(product.description ?? ''),
                  trailing: Text('\$${product.price ?? ''}'),
                  // You can display the product images here if needed
                  // For example:
                  leading: Image.network(product.images?[0] ?? ''),
                );
              },
            ),
    );
  }
}
