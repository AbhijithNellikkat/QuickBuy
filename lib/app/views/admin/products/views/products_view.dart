import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'package:quick_buy/app/controllers/products_controller.dart';
import 'package:quick_buy/app/utils/constants.dart';

class ProductsView extends StatefulWidget {
  const ProductsView({super.key});

  @override
  State<ProductsView> createState() => _ProductsViewState();
}

class _ProductsViewState extends State<ProductsView> {
  @override
  void initState() {
    Provider.of<ProductsController>(context, listen: false).fetchAllProducts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final productController = Provider.of<ProductsController>(context);
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
            : ListView.builder(
                itemCount: productController.products.length,
                itemBuilder: (context, index) {
                  final product = productController.products[index];

                  return ListTile(
                    title: Text('${product.title}'),
                    subtitle: Text('Price : ${product.price}'),
                  );
                },
              ));
  }
}
