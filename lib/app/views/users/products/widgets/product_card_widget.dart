import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProductCard extends StatelessWidget {
  final String productName;
  final String price;
  final String? imageUrl; // Optional: Pass image URL if available

  const ProductCard({
    Key? key,
    required this.productName,
    required this.price,
    this.imageUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AspectRatio(
              aspectRatio: 1,
              child: imageUrl != null
                  ? Image.network(
                      imageUrl!,
                      fit: BoxFit.cover,
                    )
                  : Image.network(
                      "https://t3.ftcdn.net/jpg/05/04/28/96/360_F_504289605_zehJiK0tCuZLP2MdfFBpcJdOVxKLnXg1.jpg",
                      fit: BoxFit.cover,
                    ) 
              ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              productName,
              maxLines: 1,
              softWrap: true,
              overflow: TextOverflow.ellipsis,
              style: GoogleFonts.poppins(
                  fontWeight: FontWeight.bold, fontSize: 14),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  price,
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.bold,
                    color: Colors.green,
                  ),
                ),
                const Icon(
                  Icons.favorite,
                  color: Colors.red,
                  size: 22,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
