// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:quick_buy/app/controllers/categories_controller.dart';
import 'package:quick_buy/app/models/categories_model.dart';
import 'package:quick_buy/app/utils/constants.dart';

class CategoriesView extends StatefulWidget {
  const CategoriesView({Key? key}) : super(key: key);

  @override
  State<CategoriesView> createState() => _CategoriesViewState();
}

class _CategoriesViewState extends State<CategoriesView> {
  // XFile? image;

  final TextEditingController categoryNameController = TextEditingController();
  final TextEditingController updateCategoryNameController =
      TextEditingController();

  @override
  void initState() {
    Provider.of<CategoryController>(context, listen: false)
        .fetchAllCategories();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final categoryController = Provider.of<CategoryController>(context);

    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: kWhite),
        title: const Text(
          "Categories",
          style: TextStyle(color: kWhite),
        ),
      ),
      body: categoryController.loading
          ? const Center(
              child: SpinKitFadingCircle(
                color: kBlack,
                size: 50.0,
              ),
            )
          : Padding(
              padding: const EdgeInsets.all(1.0),
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2),
                itemCount: categoryController.categories.length,
                itemBuilder: (context, index) {
                  final category = categoryController.categories[index];

                  return Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    child: Card(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Stack(
                            children: [
                              Container(
                                width: 170,
                                height: 130,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  image: DecorationImage(
                                    image: NetworkImage(category.image ?? ''),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              Positioned(
                                right: 8,
                                top: 5,
                                child: PopupMenuButton(
                                  color: kBlack,
                                  elevation: 1,
                                  itemBuilder: (BuildContext context) {
                                    return [
                                      PopupMenuItem(
                                        onTap: () {
                                          updateCategoryDialog(context,
                                              categoryController, category);
                                        },
                                        child: const Text(
                                          "Update category",
                                          style: TextStyle(color: kWhite),
                                        ),
                                      ),
                                      PopupMenuItem(
                                        onTap: () {
                                          showDialog(
                                            context: context,
                                            builder: (BuildContext context) {
                                              return AlertDialog(
                                                title: const Text(
                                                    "Confirm Deletion"),
                                                content: const Text(
                                                    "Are you sure you want to delete this category?"),
                                                actions: [
                                                  TextButton(
                                                    onPressed: () {
                                                      Navigator.of(context)
                                                          .pop(); // Close dialog
                                                    },
                                                    child: Text("Cancel"),
                                                  ),
                                                  TextButton(
                                                    onPressed: () async {
                                                      bool deleted =
                                                          await categoryController
                                                              .deleteCategory(
                                                                  categoryID:
                                                                      category
                                                                          .id);

                                                      if (deleted) {
                                                        ScaffoldMessenger.of(
                                                                context)
                                                            .showSnackBar(
                                                          const SnackBar(
                                                            backgroundColor:
                                                                Colors.green,
                                                            content: Text(
                                                                'category deleted successfully'),
                                                          ),
                                                        );
                                                      } else {
                                                        ScaffoldMessenger.of(
                                                                context)
                                                            .showSnackBar(
                                                          const SnackBar(
                                                            backgroundColor:
                                                                Colors.red,
                                                            content: Text(
                                                                'Failed to delete category'),
                                                          ),
                                                        );
                                                      }
                                                      Navigator.of(context)
                                                          .pop();
                                                    },
                                                    child: const Text("Delete"),
                                                  ),
                                                ],
                                              );
                                            },
                                          );
                                        },
                                        child: const Text(
                                          "Delete category",
                                          style: TextStyle(color: kWhite),
                                        ),
                                      ),
                                    ];
                                  },
                                  child: const Icon(
                                    Icons.more,
                                    size: 26,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Text(
                            category.name ?? '',
                            style: GoogleFonts.poppins(),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(8.0),
        child: FloatingActionButton(
          child: const Icon(Icons.add),
          onPressed: () {
            addCategoryBottomSheet(context, categoryController);
          },
        ),
      ),
    );
  }

  void updateCategoryDialog(BuildContext context,
      CategoryController categoryController, CategoriesModel category) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Category Update"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: updateCategoryNameController,
                decoration: const InputDecoration(labelText: 'Category Name'),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close dialog
              },
              child: Text("Cancel"),
            ),
            TextButton(
              onPressed: () async {
                CategoriesModel updatedCategoryName =
                    CategoriesModel(name: updateCategoryNameController.text);
                await categoryController.updateCategory(
                    categoryId: category.id!,
                    categoriesModel: updatedCategoryName);

                Navigator.of(context).pop();
              },
              child: const Text("update"),
            ),
          ],
        );
      },
    );
  }

  Future<dynamic> addCategoryBottomSheet(
      BuildContext context, CategoryController categoryController) {
    return showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextField(
                controller: categoryNameController,
                decoration: const InputDecoration(labelText: 'Category Name'),
              ),
              const SizedBox(height: 20),
              // image == null
              //     ? TextButton(
              //         onPressed: () {
              //           pickImage();
              //         },
              //         child: const Text('Upload image'))
              //     : Image.file(
              //         File(image!.path),
              //         height: 200,
              //       ),
              Center(
                child: ElevatedButton(
                  onPressed: () async {
                    if (categoryNameController.text.trim().isNotEmpty) {
                      final newCategoryData = CategoriesModel(
                        image:
                            "https://t3.ftcdn.net/jpg/05/04/28/96/360_F_504289605_zehJiK0tCuZLP2MdfFBpcJdOVxKLnXg1.jpg",
                        name: categoryNameController.text.trim(),
                      );

                      categoryController.createNewCategory(
                        categoriesModel: newCategoryData,
                      );
                      Navigator.of(context).pop();
                    } else {
                      // Handle case where image or category name is not provided
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text(
                              'Please provide an image and category name.'),
                        ),
                      );
                    }
                  },
                  child: const Text('Add Category'),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  // Future<void> pickImage() async {
  //   final picker = ImagePicker();
  //   final pickedImage = await picker.pickImage(source: ImageSource.gallery);
  //   if (pickedImage != null) {
  //     setState(() {
  //       image = pickedImage;
  //       log("Image Path: ${image!.path}"); // Log image path for debugging
  //     });
  //   }
  // }
}
