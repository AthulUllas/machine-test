import 'package:flutter/material.dart';
import 'package:machinetest_trogun/feature/view/widgets/bottom_nav_bar.dart';
import 'package:machinetest_trogun/feature/view/widgets/new_products.dart';
import 'package:machinetest_trogun/feature/view/widgets/trending_products.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Row(
          children: [
            Icon(
              Icons.location_on_sharp,
              size: 20,
            ),
            SizedBox(
              width: 10,
            ),
            Column(
              children: [
                Text(
                  "Store Location",
                  style: TextStyle(fontSize: 12),
                ),
                Text(
                  "Palazhi, Calicut",
                  style: TextStyle(fontSize: 12),
                )
              ],
            ),
          ],
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: IconButton(
                onPressed: () {}, icon: const Icon(Icons.card_travel_rounded)),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              width: double.infinity,
              height: 300,
              child: Image.network(
                "https://img.freepik.com/free-photo/blue-headphones-isolated-white-background_23-2147827665.jpg?t=st=1730987668~exp=1730991268~hmac=f7e12ba5b34776af74b107f5fd6ad3b60192d9e8907205d42ec04405a5a50142&w=1380",
                fit: BoxFit.cover,
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 24.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 24.0),
                    child: Text(
                      "New Arrivals",
                      style: TextStyle(fontSize: 24),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: 24.0),
                    child: Icon(Icons.keyboard_arrow_right_rounded),
                  )
                ],
              ),
            ),
            const Padding(
                padding: EdgeInsets.only(top: 16.0), child: NewProducts()),
            const Padding(
              padding: EdgeInsets.only(top: 32.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 24.0),
                    child: Text(
                      "Trending Products",
                      style: TextStyle(fontSize: 24),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: 24.0),
                    child: Icon(Icons.keyboard_arrow_right_rounded),
                  )
                ],
              ),
            ),
            const Padding(
                padding: EdgeInsets.only(top: 16.0), child: TrendingProducts()),
          ],
        ),
      ),
      bottomNavigationBar: const BottomNavBar(),
    );
  }
}
