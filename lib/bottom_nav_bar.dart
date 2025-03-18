import 'package:flutter/material.dart';
import 'main_page.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          IconButton(
            icon: const Icon(Icons.home, color: Colors.black, size: 30),
            onPressed: () {
              // Navigate to home page
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
              // Favorites functionality to be implemented
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
    );
  }
}
