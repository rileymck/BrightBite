import 'package:flutter/material.dart';
import 'bottom_nav_bar.dart'; 

class ProductGuide extends StatelessWidget {
  const ProductGuide({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Product Guide',
          style: TextStyle(
            fontFamily: 'Source Serif Pro',
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: const Color(0xFF0051C1),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      backgroundColor: const Color(0xFF0051C1), // Bright blue background
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Icon(
              Icons.cleaning_services, // Toothbrush icon alternative
              size: 80,
              color: Colors.white,
            ),
            const SizedBox(height: 10),
            const Text(
              'Product Guide',
              style: TextStyle(
                fontSize: 24,
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontFamily: 'Source Serif Pro',
              ),
            ),
            const SizedBox(height: 30),
            _buildMenuButton(context, 'Toothbrush', Icons.brush),
            const SizedBox(height: 15),
            _buildMenuButton(context, 'Toothpaste', Icons.medical_services),
            const SizedBox(height: 15),
            _buildMenuButton(context, 'Floss & Interdental Aids', Icons.grass),
            const SizedBox(height: 15),
            _buildMenuButton(context, 'Mouthrinse', Icons.local_drink),
            const SizedBox(height: 15),
            _buildMenuButton(context, 'Other', Icons.more_horiz),
          ],
        ),
      ),
      bottomNavigationBar: const BottomNavBar(), 
    );
  }

  // Helper function to build a menu button
  Widget _buildMenuButton(BuildContext context, String title, IconData icon) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white,
          padding: const EdgeInsets.symmetric(vertical: 15),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
            side: const BorderSide(color: Colors.black, width: 2),
          ),
        ),
        onPressed: () {
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: Colors.black),
            const SizedBox(width: 10),
            Text(
              title,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 18,
                fontWeight: FontWeight.bold,
                fontFamily: 'Source Serif Pro',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
