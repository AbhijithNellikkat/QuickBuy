import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:quick_buy/app/controllers/userside_products_controller.dart';
import 'package:quick_buy/app/utils/constants.dart';
import 'package:quick_buy/app/views/users/products/view/product_details_view.dart';
import 'package:quick_buy/app/views/users/products/widgets/product_card_widget.dart';

class ProductsView extends StatefulWidget {
  const ProductsView({Key? key}) : super(key: key);

  @override
  State<ProductsView> createState() => _ProductsViewState();
}

class _ProductsViewState extends State<ProductsView> {
  @override
  void initState() {
    Provider.of<UserProductsController>(context, listen: false)
        .fetchAllProducts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final productController = Provider.of<UserProductsController>(context);
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        iconTheme: const IconThemeData(color: kWhite),
        title: Text(
          "Products",
          style:
              GoogleFonts.poppins(color: kWhite, fontWeight: FontWeight.w200),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 13, vertical: 20),
        child: GridView.builder(
          itemCount: productController.products.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 20,
            crossAxisSpacing: 20,
            childAspectRatio: 0.7, // Adjust this ratio as needed
          ),
          itemBuilder: (context, index) {
            final product = productController.products[index];
            return GestureDetector(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => ProductDetailsView(
                      productName: "${product.title}",
                      price: "\$'${product.price}",
                      description: "${product.description}",
                      images: product.images,
                      category: '${product.category.name}' ),
                ));
              },
              child: ProductCard(
                productName: "${product.title}",
                price: "\$'${product.price}",
                imageUrl: product.images[0],
              ),
            );
          },
        ),
      ),
    );
  }
}
