import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:quick_buy/app/models/products_model.dart';
import 'package:quick_buy/app/services/adminside_products_serivce.dart';
import 'package:quick_buy/app/utils/constants.dart';

class AddNewProductView extends StatefulWidget {
  const AddNewProductView({Key? key}) : super(key: key);

  @override
  State<AddNewProductView> createState() => _AddNewProductViewState();
}

class _AddNewProductViewState extends State<AddNewProductView> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController titleController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  List<File> _images = [];

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
          key: formKey,
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
                onPressed: () {
                  _pickImage();
                },
                child: const Text('Select Image'),
              ),
              const SizedBox(height: 22),
              _images.isNotEmpty
                  ? SizedBox(
                      height: 200,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: _images.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Image.file(_images[index]),
                          );
                        },
                      ),
                    )
                  : Container(),
              const SizedBox(height: 22),
              ElevatedButton(
                onPressed: () {
                  _addProduct();
                },
                child: const Text('Add Product'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        _images.add(File(pickedFile.path));
      } else {
        log('No image selected.');
      }
    });
  }

  void _addProduct() {
    if (formKey.currentState == null) {
      return;
    }

    if (!formKey.currentState!.validate()) {
      return;
    }

    if (_images.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please select at least one image')),
      );
      return;
    }

    List<String> imageBase64List = [];

    for (File imageFile in _images) {
      List<int> imageBytes = imageFile.readAsBytesSync();
      String base64Image = base64Encode(imageBytes);
      imageBase64List.add(base64Image);
    }

    final newProduct = ProductsModel(
      title: titleController.text,
      price: int.tryParse(priceController.text) ??
          0, // Handle null or invalid input
      description: descriptionController.text,
      images: imageBase64List,
    );

    ProductsService().createProduct(newProduct).then((success) {
      if (success) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Product added successfully')),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Failed to add product')),
        );
      }
    });
  }
}
