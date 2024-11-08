import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:machinetest_trogun/feature/controller/product_controller.dart';
import 'package:machinetest_trogun/feature/view/pages/product_page.dart';

class NewProducts extends StatelessWidget {
  const NewProducts({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final productController = Get.find<ProductController>();

    final newProducts = [
      "https://img.freepik.com/free-vector/realistic-smartphone-with-black-back-case_23-2148355781.jpg?t=st=1731000449~exp=1731004049~hmac=ca2f328d63759fedab65b55ac6e6d282d398d27c895a8b2aaf7d605aa77befcb&w=826",
      "https://img.freepik.com/free-vector/realistic-black-smartphone-design-with-two-cameras_23-2148374057.jpg?t=st=1731000491~exp=1731004091~hmac=459818ae08fb7ccec74ccb1185b72dae6f90410c0479065f8409c1c96e5c3a1b&w=826",
      "https://img.freepik.com/free-photo/earphones-with-case-surrounded-by-nature-scene_23-2150165594.jpg?t=st=1730998040~exp=1731001640~hmac=7b5c3b18ff21a9dafab045aeb327ed1c6306d839b6c7a54683cb7f450d23bdec&w=826",
      "https://img.freepik.com/free-vector/phone-with-gradient-wallpaper_23-2147848028.jpg?t=st=1731000547~exp=1731004147~hmac=a5fad2ebb7996cb7c640b66e528a27fff084558e7e07e058750d862b5c18c459&w=826",
      "https://img.freepik.com/free-photo/room-interior-design_23-2148899490.jpg?t=st=1730998169~exp=1731001769~hmac=0055085d7520f8bc94dd396890370c934acb1726f9b6bf663259767d8dff9831&w=1380"
    ];

    return SizedBox(
      height: 200,
      child: Obx(() {
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
            itemCount: products.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              final dicountedPrice =
                  products[index].price - (products[index].price * 0.1);
              final imageUrl = newProducts[index % newProducts.length];

              return InkWell(
                onTap: () => Get.to(() => ProductPage(
                      product: products[index],
                      imageUrl: imageUrl,
                    )),
                child: Container(
                    margin: const EdgeInsets.only(left: 24),
                    child: Column(
                      children: [
                        Container(
                          width: 80,
                          height: 100,
                          decoration: const BoxDecoration(),
                          child: Image.network(imageUrl),
                        ),
                        Text(
                          products[index].name,
                          style: const TextStyle(fontSize: 16),
                        ),
                        Text(
                          dicountedPrice.toStringAsFixed(2),
                          style: const TextStyle(
                            fontSize: 12,
                          ),
                        ),
                        Stack(
                          children: [
                            Text(
                              products[index].price.toStringAsFixed(2),
                              style: const TextStyle(fontSize: 8),
                            ),
                            Positioned(
                              top: 4,
                              child: Container(
                                decoration:
                                    const BoxDecoration(color: Colors.red),
                                width: 30,
                                height: 1,
                              ),
                            )
                          ],
                        )
                      ],
                    )),
              );
            });
      }),
    );
  }
}
