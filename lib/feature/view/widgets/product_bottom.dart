import 'package:flutter/material.dart';

class ProductBottom extends StatelessWidget {
  const ProductBottom({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(color: Colors.white),
      height: 60,
      child: Center(
        child: InkWell(
          onTap: () {},
          splashColor: Colors.grey,
          child: Container(
            decoration: BoxDecoration(
                color: Colors.black, borderRadius: BorderRadius.circular(30)),
            width: 440,
            height: 50,
            child: const Center(
                child: Text("Buy Now",
                    style: TextStyle(color: Colors.white, fontSize: 16))),
          ),
        ),
      ),
    );
  }
}
