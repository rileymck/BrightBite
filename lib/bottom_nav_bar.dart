import 'package:flutter/material.dart';
import 'package:test_flutter/favorites_page.dart';
import 'main_page.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: Colors.white,
      shape: const CircularNotchedRectangle(), // Retaining the notch design
      notchMargin: 5,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              icon: const Icon(Icons.home, color: Colors.black, size: 30),
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const MainPage()),
                );
              },
            ),
            IconButton(
              icon: const Icon(Icons.search, color: Colors.black, size: 30),
              onPressed: () {
                // Search functionality to be implemented
              },
            ),
            IconButton(
              icon: const Icon(Icons.favorite, color: Colors.black, size: 30),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const FavoritesPage()),
                );
              },
            ),
            IconButton(
              icon: const Icon(Icons.chat_bubble, color: Colors.black, size: 30),
              onPressed: () {
                // Chat functionality to be implemented
              },
            ),
          ],
        ),
      ),
    );
  }
}
