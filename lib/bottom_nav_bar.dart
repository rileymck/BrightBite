import 'package:flutter/material.dart';
import 'package:test_flutter/favorites_page.dart';


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
                //navigate to home
              },
            ),
            IconButton(
              icon: const Icon(Icons.search, color: Colors.black),
              onPressed: () {
                // TODO: Implement navigation later
                //navigate to search
              },
            ),
            IconButton(
              icon: const Icon(Icons.favorite, color: Colors.black),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const FavoritesPage()),
                );
              },
            ),
            IconButton(
              icon: const Icon(Icons.chat, color: Colors.black),
              onPressed: () {
                // TODO: Implement navigation later
                //navigate to chat
              },
            ),
          ],
        ),
      ),
    );
  }
}
