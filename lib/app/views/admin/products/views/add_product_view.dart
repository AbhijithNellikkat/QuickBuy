import 'package:flutter/material.dart';
import 'package:quick_buy/app/utils/constants.dart';

class AddNewProductView extends StatefulWidget {
  const AddNewProductView({super.key});

  @override
  State<AddNewProductView> createState() => _AddNewProductViewState();
}

class _AddNewProductViewState extends State<AddNewProductView> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController titleController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: kWhite),
        title: const Text(
          "Add Products",
          style: TextStyle(color: kWhite),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(22.0),
        child: Form(
          child: ListView(
            children: [
              TextFormField(
                controller: titleController,
                decoration: const InputDecoration(
                  labelText: 'Title',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter a title';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 22),
              TextFormField(
                controller: priceController,
                decoration: const InputDecoration(
                  labelText: 'Price',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter a price';
                  }
                  if (double.tryParse(value) == null) {
                    return 'Please enter a valid number';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 22),
              TextFormField(
                controller: descriptionController,
                decoration: const InputDecoration(
                  labelText: 'Description',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter a description';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 22),
              ElevatedButton(
                onPressed: () {},
                child: const Text('Add Product'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
