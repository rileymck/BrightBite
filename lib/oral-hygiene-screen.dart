import 'package:flutter/material.dart';
 import 'bottom_nav_bar.dart';

class OralHygiene extends StatelessWidget {
  const OralHygiene({super.key});

  @override
  Widget build(BuildContext context) {
    // Get screen size for responsive design
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: const Color(0xFF0051C1), // Background color (blue)
      body: SafeArea(
        child: Column(
          children: [
            // **Header with Logo & Title**
            Padding(
              padding: EdgeInsets.symmetric(vertical: screenHeight * 0.05),
              child: Column(
                children: [
                  // Logo
                  Image.asset(
                    'assets/images/oralHygieneLogo.png', 
                    height: screenHeight * 0.1,
                  ),
                  const SizedBox(height: 10),
                  // Title
                  const Text(
                    "Oral Hygiene",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'PT Serif',
                    ),
                  ),
                ],
              ),
            ),

            // **Scrollable Buttons**
            Expanded(
              child: ListView(
                padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.08),
                children: [
                  _buildMenuButton(context, "How to brush", () {
                    // Navigate to brushing guide
                  }),
                  _buildMenuButton(context, "How to floss", () {
                    // Navigate to flossing guide
                  }),
                  _buildMenuButton(context, "What are interdental aids", () {
                    // Navigate to interdental aids guide
                  }),
                  _buildMenuButton(context, "How to clean your tongue", () {
                    // Navigate to tongue cleaning guide
                  }),
                  _buildMenuButton(context, "Other", () {
                    // Navigate to other guides
                  }),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // **Reusable Button Widget**
  Widget _buildMenuButton(BuildContext context, String text, VoidCallback onTap) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 15),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: Colors.black, width: 3),
          ),
          child: Center(
            child: Text(
              text,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
