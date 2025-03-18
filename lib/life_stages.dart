import 'package:flutter/material.dart';
import 'bottom_nav_bar.dart'; // Import BottomNavBar

class LifeStagesPage extends StatelessWidget {
  const LifeStagesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          '',
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
      backgroundColor: const Color(0xFF0051C1), // Match Smile Academy's background
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Icon(
                Icons.family_restroom, // Family icon for life stages
                size: 80,
                color: Colors.white,
              ),
              const SizedBox(height: 10),
              const Text(
                'Life Stages',
                style: TextStyle(
                  fontSize: 24,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Source Serif Pro',
                ),
              ),
              const SizedBox(height: 30),
              const Text(
                'Discover dental care tips for every stage of life.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                  fontFamily: 'Source Serif Pro',
                ),
              ),
              const SizedBox(height: 10),
              _buildInfoCard(context, 'Infants'),
              const SizedBox(height: 10),
              _buildInfoCard(context, 'Children'),
              const SizedBox(height: 10),
              _buildInfoCard(context, 'Teens'),
              const SizedBox(height: 10),
              _buildInfoCard(context, 'Adults'),
              const SizedBox(height: 10),
              _buildInfoCard(context, 'Seniors'),
            ],
          ),
        ),
      ),
      bottomNavigationBar: const BottomNavBar(), // ✅ BottomNavBar for consistency
    );
  }

  Widget _buildInfoCard(BuildContext context, String title) {
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
        onPressed: () {},
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
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
