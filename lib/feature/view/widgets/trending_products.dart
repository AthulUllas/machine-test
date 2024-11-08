import 'package:flutter/material.dart';
import 'package:machinetest_trogun/feature/controller/product_controller.dart';
import 'package:get/get.dart';
import 'package:machinetest_trogun/feature/view/pages/product_page.dart';

class TrendingProducts extends StatelessWidget {
  const TrendingProducts({super.key});

  @override
  Widget build(BuildContext context) {
    final productController = Get.find<ProductController>();
    final List trendingProducts = [
      "https://img.freepik.com/free-vector/isometric-mobile-phone-background-template_52683-7075.jpg?t=st=1730999989~exp=1731003589~hmac=f9c3d5002178c544f68c4357ddec7e82fbbe633017a4158d117041f41177e946&w=1380",
      "https://img.freepik.com/free-vector/flat-design-phone-different-perspectives_52683-52676.jpg?t=st=1731000029~exp=1731003629~hmac=ba1ad45b0b47e2f599030eac8a2b4113548dbe1931c460802bb84a481049cb7e&w=1380",
      "https://img.freepik.com/free-photo/discount-headphones-podium_23-2150165470.jpg?t=st=1731000098~exp=1731003698~hmac=6664b33e1603094fbc0ae4127b37ab886db6f6ba869280a34b04390f287ce28c&w=996",
      "https://img.freepik.com/free-photo/sale-with-special-discount-headphones_23-2150040401.jpg?t=st=1731000205~exp=1731003805~hmac=eb4969505768009cae27bd8211c8ee9b894694bcae7891e4d405fb94f9de31c9&w=1380"
    ];

    return SizedBox(
      height: 200,
      child: Obx(
        () {
          if (productController.error.value.isNotEmpty) {
            return Center(
              child: Text(productController.error.value),
            );
          }

          if (productController.isLoading.value) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          final products = productController.products;

          return ListView.builder(
            itemCount: trendingProducts.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              final String randomUrl =
                  trendingProducts[index % trendingProducts.length];
              return InkWell(
                onTap: () => Get.to(() => ProductPage(
                      product: products[index],
                      imageUrl: randomUrl,
                    )),
                child: Container(
                  margin: const EdgeInsets.only(left: 8),
                  child: SizedBox(
                    child: Image.network(randomUrl),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
