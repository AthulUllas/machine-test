import 'package:custom_rating_bar/custom_rating_bar.dart';
import 'package:flutter/material.dart';
import 'package:machinetest_trogun/feature/model/product_model.dart';
import 'package:machinetest_trogun/feature/view/widgets/product_bottom.dart';

class ProductPage extends StatelessWidget {
  final Products product;
  final String imageUrl;

  const ProductPage({super.key, required this.product, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    final dicountedPrice = product.price - (product.price * 0.1);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
                width: double.infinity,
                height: 400,
                child: Image.network(imageUrl)),
            Padding(
              padding: const EdgeInsets.only(top: 32.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 24.0),
                    child: Text(
                      product.brand,
                      style: const TextStyle(
                          fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 24.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        RatingBar.readOnly(
                          isHalfAllowed: true,
                          alignment: Alignment.center,
                          filledIcon: Icons.star,
                          emptyIcon: Icons.star_border,
                          emptyColor: Colors.grey,
                          filledColor: Colors.amberAccent,
                          halfFilledColor: Colors.amberAccent,
                          halfFilledIcon: Icons.star_half,
                          initialRating: product.rating,
                          maxRating: 5,
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 24.0),
              child: Row(
                children: [Text(product.name)],
              ),
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 24.0, top: 24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        dicountedPrice.toString(),
                        style: const TextStyle(
                            fontSize: 32, fontWeight: FontWeight.w500),
                      ),
                      Stack(
                        children: [
                          Text(
                            product.price.toString(),
                            style: const TextStyle(fontSize: 24),
                          ),
                          Positioned(
                            top: 12,
                            child: Container(
                              decoration:
                                  const BoxDecoration(color: Colors.red),
                              width: 80,
                              height: 4,
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 24.0, top: 24),
              child: Row(
                children: [
                  Text(
                    product.description,
                    style: const TextStyle(fontSize: 16),
                  )
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 24, top: 32),
              child: Row(
                children: [
                  Text(
                    "Reviews",
                    style: TextStyle(fontSize: 24, color: Colors.grey),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 24.0, top: 12),
              child: Column(
                children: product.reviews!.map((review) {
                  return Row(
                    children: [Text(review.comment.toString())],
                  );
                }).toList(),
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: const ProductBottom(),
    );
  }
}
