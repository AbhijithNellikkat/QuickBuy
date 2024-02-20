import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'package:quick_buy/app/controllers/adminside_products_controller.dart';
import 'package:quick_buy/app/utils/constants.dart';
import 'package:quick_buy/app/views/admin/products/views/add_product_view.dart';

class ProductsView extends StatefulWidget {
  const ProductsView({super.key});

  @override
  State<ProductsView> createState() => _ProductsViewState();
}

class _ProductsViewState extends State<ProductsView> {
  @override
  void initState() {
    Provider.of<AdminProductsController>(context, listen: false)
        .fetchAllProducts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final productController = Provider.of<AdminProductsController>(context);
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: kWhite),
        title: const Text(
          "Products",
          style: TextStyle(color: kWhite),
        ),
      ),
      body: productController.loading
          ? const Center(
              child: SpinKitFadingCircle(
                color: kBlack,
                size: 50.0,
              ),
            )
          : Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
              child: ListView.builder(
                itemCount: productController.products.length,
                itemBuilder: (context, index) {
                  final product = productController.products[index];

                  return Card(
                    child: ListTile(
                      leading: const CircleAvatar(
                        backgroundColor: kBlack,
                        child: Icon(
                          Icons.not_interested_rounded,
                          color: kWhite,
                        ),
                      ),
                      title: Text(
                        '${product.title}',
                      ),
                      subtitle: Text('Price : ${product.price}'),
                      trailing: IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.delete),
                      ),
                    ),
                  );
                },
              ),
            ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(10.0),
        child: FloatingActionButton(
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => AddNewProductView(),
            ));
          },
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
