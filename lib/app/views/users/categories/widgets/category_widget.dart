import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';

class CategoryWidget extends StatelessWidget {
  final String categoryImage;
  final String categoryname;
  const CategoryWidget({
    Key? key,
    required this.categoryImage,
    required this.categoryname,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: FancyShimmerImage(
              height: size.width * 0.45,
              width: size.width * 0.45,
              errorWidget: const Icon(
                Icons.dangerous,
                color: Colors.red,
                size: 88,
              ),
              imageUrl: categoryImage,
              boxFit: BoxFit.fill,
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: double.infinity,
              height: 20,
              color: const Color.fromARGB(179, 245, 245, 245).withOpacity(0.3),
              child: Text(
                categoryname,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
