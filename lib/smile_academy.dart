import 'package:flutter/material.dart';
import 'bottom_nav_bar.dart'; // ✅ Import BottomNavBar

class SmileAcademy extends StatelessWidget {
  const SmileAcademy({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Smile Academy',
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
              Icons.school, // Graduation cap icon
              size: 80,
              color: Colors.white,
            ),
            const SizedBox(height: 10),
            const Text(
              'Smile Academy',
              style: TextStyle(
                fontSize: 24,
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontFamily: 'Source Serif Pro',
              ),
            ),
            const SizedBox(height: 30),
            _buildMenuButton(context, 'Oral Hygiene', Icons.clean_hands),
            const SizedBox(height: 15),
            _buildMenuButton(context, 'Dental Treatment', Icons.medical_services),
            const SizedBox(height: 15),
            _buildMenuButton(context, 'Life Stages', Icons.cake),
          ],
        ),
      ),
      bottomNavigationBar: const BottomNavBar(), // ✅ Added BottomNavBar
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
          // TODO: Navigate to respective page
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
