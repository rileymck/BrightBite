import 'package:flutter/material.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: Colors.white,
      shape: const CircularNotchedRectangle(), // Optional rounded effect
      notchMargin: 5, // Space around the notch
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              icon: const Icon(Icons.home, color: Colors.black),
              onPressed: () {
                // TODO: Implement navigation later
              },
            ),
            IconButton(
              icon: const Icon(Icons.search, color: Colors.black),
              onPressed: () {
                // TODO: Implement navigation later
              },
            ),
            IconButton(
              icon: const Icon(Icons.favorite, color: Colors.black),
              onPressed: () {
                // TODO: Implement navigation later
              },
            ),
            IconButton(
              icon: const Icon(Icons.chat, color: Colors.black),
              onPressed: () {
                // TODO: Implement navigation later
              },
            ),
          ],
        ),
      ),
    );
  }
}
