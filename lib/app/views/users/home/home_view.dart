import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quick_buy/app/utils/constants.dart';
import 'package:quick_buy/app/views/admin/admin_view.dart';
import 'package:quick_buy/app/views/users/home/widgets/sale_widget.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => AdminView(),
                ));
              },
              icon: Icon(Icons.admin_panel_settings),
            ),
          )
        ],
        automaticallyImplyLeading: false,
        iconTheme: const IconThemeData(color: kWhite),
        title: Text(
          "Quick Buy",
          style:
              GoogleFonts.poppins(color: kWhite, fontWeight: FontWeight.w200),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(11.0),
        child: Column(
          children: [
            const SizedBox(height: 18),
            TextField(
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                  hintText: 'Search',
                  filled: true,
                  fillColor: Theme.of(context).cardColor,
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(
                        color: Color.fromARGB(255, 82, 82, 82)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(
                        color: Color.fromARGB(255, 32, 125, 248)),
                  ),
                  suffixIcon: const Icon(Icons.search)),
            ),
            const SizedBox(height: 18),
            SizedBox(
              height: size.height * 0.25,
              child: Swiper(
                itemCount: 3,
                itemBuilder: (ctx, index) {
                  return const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: SaleWidget(),
                  );
                },
                autoplay: true,
                pagination: const SwiperPagination(
                  alignment: Alignment.bottomCenter,
                  builder: DotSwiperPaginationBuilder(
                      color: Colors.white, activeColor: Colors.red),
                ),
                // control: const SwiperControl(),
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Text("Latest Products",
                      style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w400, fontSize: 18)),
                ],
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              height: size.height * 0.25,
              child: Swiper(
                itemCount: 4,
                itemBuilder: (ctx, index) {
                  return Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Container(
                      width: double.infinity,
                      height: size.height * 0.4,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(18),
                        gradient: const LinearGradient(
                            colors: [
                              Color.fromARGB(255, 99, 98, 100),
                              Color.fromARGB(255, 2, 2, 2),
                            ],
                            begin: FractionalOffset(0.0, 0.0),
                            end: FractionalOffset(1.0, 0.0),
                            stops: [0.0, 1.0],
                            tileMode: TileMode.clamp),
                      ),
                      child: Row(
                        children: [
                          Flexible(
                            flex: 3,
                            child: Padding(
                              padding: const EdgeInsets.all(14.0),
                              child: Image.asset(
                                width: double.infinity,
                                // height: double.infinity,
                                "assets/images/photo-1542291026-7eec264c27ff-removebg-preview.png",
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Flexible(
                            flex: 3,
                            child: Padding(
                              padding: const EdgeInsets.all(14.0),
                              child: Image.network(
                                width: double.infinity,
                                // height: double.infinity,
                                "https://i.ibb.co/vwB46Yq/shoes.png",
                                fit: BoxFit.contain,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
                autoplay: false,
                pagination: const SwiperPagination(
                  alignment: Alignment.bottomCenter,
                  builder: DotSwiperPaginationBuilder(
                      color: Colors.white, activeColor: Colors.red),
                ),
                // control: const SwiperControl(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
