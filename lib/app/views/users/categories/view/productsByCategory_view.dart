import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:quick_buy/app/controllers/userside_categories_controller.dart';
import 'package:quick_buy/app/utils/constants.dart';
import 'package:quick_buy/app/views/users/products/view/product_details_view.dart';
import 'package:quick_buy/app/views/users/products/widgets/product_card_widget.dart';

class ProductsByCategoryView extends StatefulWidget {
  final categoryId;

  const ProductsByCategoryView({Key? key, required this.categoryId})
      : super(key: key);

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
        iconTheme: const IconThemeData(color: kWhite),
        title: Text(
          "Products By Category",
          style: GoogleFonts.poppins(
            color: kWhite,
            fontWeight: FontWeight.w200,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 13, vertical: 20),
        child: userCategoryController.loading
            ? const Center(
                child: SpinKitFadingCircle(
                  color: kBlack,
                  size: 50.0,
                ),
              )
            : GridView.builder(
                itemCount: userCategoryController.productsByCategory
                    .length, // Update with the actual product count
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 20,
                  crossAxisSpacing: 20,
                  childAspectRatio: 0.7,
                ),
                itemBuilder: (context, index) {
                  final product =
                      userCategoryController.productsByCategory[index];
                  return GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => ProductDetailsView(
                          productName: product.title ?? '',
                          price: '\$${product.price ?? ''}',
                          description: product.description ?? '',
                          images: product.images ?? [],
                          category:
                              'shoe', // You can pass the actual category here
                        ),
                      ));
                    },
                    child: ProductCard(
                      productName: product.title ?? '',
                      price: '\$${product.price ?? ''}',
                      imageUrl: product.images?[0] ?? '',
                    ),
                  );
                },
              ),
      ),
    );
  }
}
