import 'package:flutter/material.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          border: Border(top: BorderSide(color: Colors.black, width: 0.1))),
      height: 80,
      child: Padding(
        padding: const EdgeInsets.only(top: 4.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              children: [
                IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.home_outlined,
                      size: 32,
                    )),
                const Text("Home")
              ],
            ),
            Column(
              children: [
                IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.search_rounded,
                      size: 32,
                    )),
                const Text("Search")
              ],
            ),
            Column(
              children: [
                IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.person_outline_rounded,
                      size: 32,
                    )),
                const Text("Profile"),
              ],
            )
          ],
        ),
      ),
    );
  }
}
