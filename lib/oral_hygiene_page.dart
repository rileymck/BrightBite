import 'package:flutter/material.dart';
import 'bottom_nav_bar.dart';

class OralHygienePage extends StatelessWidget {
  const OralHygienePage({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final isTablet = screenSize.width > 600;

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
      backgroundColor: const Color(0xFF0051C1),
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(
                  horizontal: isTablet ? screenSize.width * 0.15 : screenSize.width * 0.08,
                  vertical: isTablet ? 30 : 20,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Icon(Icons.clean_hands, size: 80, color: Colors.white),
                    const SizedBox(height: 10),
                    const Text(
                      'Oral Hygiene',
                      style: TextStyle(
                        fontSize: 28,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Source Serif Pro',
                      ),
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      'Learn the best practices for maintaining a clean and healthy mouth.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                        fontFamily: 'Source Serif Pro',
                      ),
                    ),
                    const SizedBox(height: 20),
                    _buildInfoCard(context, 'Brushing Technique'),
                    const SizedBox(height: 10),
                    _buildInfoCard(context, 'Flossing'),
                    const SizedBox(height: 10),
                    _buildInfoCard(context, 'Tongue Cleaning'),
                    const SizedBox(height: 10),
                    _buildInfoCard(context, 'Mouthwash Use'),
                    const SizedBox(height: 10),
                    _buildInfoCard(context, 'Habits to Avoid'),
                  ],
                ),
              ),
            ),
            const BottomNavBar(),
          ],
        ),
      ),
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
        onPressed: () {
          // You can add navigation or pop-up info here later
        },
        child: Text(
          title,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.bold,
            fontFamily: 'Source Serif Pro',
          ),
        ),
      ),
    );
  }
}
