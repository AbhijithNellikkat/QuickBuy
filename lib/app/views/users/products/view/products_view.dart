import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:quick_buy/app/controllers/products_filter_controller.dart';
import 'package:quick_buy/app/utils/constants.dart';
import 'package:quick_buy/app/views/users/products/view/product_details_view.dart';
import 'package:quick_buy/app/views/users/products/widgets/product_card_widget.dart';

class ProductsView extends StatefulWidget {
  const ProductsView({Key? key}) : super(key: key);

  @override
  State<ProductsView> createState() => _ProductsViewState();
}

class _ProductsViewState extends State<ProductsView> {
  final TextEditingController titleFilterController = TextEditingController();
  @override
  void initState() {
    Provider.of<ProductsFilterController>(context, listen: false)
        .fetchAllProducts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // final productController = Provider.of<UserProductsController>(context);
    final filterController = Provider.of<ProductsFilterController>(context);
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        iconTheme: const IconThemeData(color: kWhite),
        title: Text(
          "Products",
          style:
              GoogleFonts.poppins(color: kWhite, fontWeight: FontWeight.w200),
        ),
        bottom: PreferredSize(
          preferredSize: const Size(double.infinity, 60),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: double.infinity,
                  height: 50,
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(33)),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        TextButton(
                          onPressed: () {
                            filterController.fetchAllProducts();
                          },
                          child: Text("All"),
                        ),
                        TextButton(
                          onPressed: () {
                            showTitleFilterDialog(context, filterController);
                          },
                          child: Text("Filter by title"),
                        ),
                        TextButton(
                          onPressed: () {},
                          child: Text("Filter by price"),
                        ),
                        TextButton(
                          onPressed: () {},
                          child: Text("Filter by category"),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 13, vertical: 20),
        child: GridView.builder(
          itemCount: filterController.filteredProducts.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 20,
            crossAxisSpacing: 20,
            childAspectRatio: 0.7, // Adjust this ratio as needed
          ),
          itemBuilder: (context, index) {
            final product = filterController.filteredProducts[index];
            return GestureDetector(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => ProductDetailsView(
                      productName: "${product.title}",
                      price: "\$'${product.price}",
                      description: "${product.description}",
                      images: product.images,
                      category: '${product.category.name}'),
                ));
              },
              child: ProductCard(
                productName: "${product.title}",
                price: "\$${product.price}",
                imageUrl: product.images[0],
              ),
            );
          },
        ),
      ),
    );
  }

  void showTitleFilterDialog(
      BuildContext context, ProductsFilterController filterController) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Filter by Title"),
          content: TextField(
            controller: titleFilterController,
            decoration: InputDecoration(
              hintText: "Enter title",
              border: OutlineInputBorder(),
            ),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                filterController.fetchAllFilterByTitleProducts(
                    title: titleFilterController.text.trim());
                Navigator.of(context).pop();
              },
              child: Text('Apply'),
            ),
          ],
        );
      },
    );
  }
}
