import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quick_buy/app/utils/constants.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.logout_outlined),
          ),
          const SizedBox(width: 20),
        ],
        automaticallyImplyLeading: false,
        iconTheme: const IconThemeData(color: kWhite),
        title: Text(
          "Quick Buy",
          style:
              GoogleFonts.poppins(color: kWhite, fontWeight: FontWeight.w200),
        ),
      ),
      body: const Center(
        child: Text("Home View"),
      ),
    );
  }
}
