import 'package:flutter/material.dart';
import 'dart:math' show min;
import 'bottom_nav_bar.dart';

class ProductGuide extends StatelessWidget {
  const ProductGuide({super.key});

  @override
  Widget build(BuildContext context) {
    // Get screen dimensions
    final screenSize = MediaQuery.of(context).size;
    final width = screenSize.width;
    final height = screenSize.height;
    final isTablet = width > 600; // Simple check for tablet

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          '', // Empty title as requested
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
        bottom: false, // Allow content to extend below safe area
        child: Column(
          children: [
            // Main scrollable content
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: isTablet ? width * 0.15 : width * 0.08,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                          height: isTablet ? height * 0.08 : height * 0.03),

                      // Icon and title
                      Image.asset(
                        'assets/images/toothbrush_toothpaste_icon.png',
                        width: min(width * 0.15, 120),
                        height: min(width * 0.15, 120),
                        color: Colors.white,
                      ),
                      SizedBox(height: height * 0.02),
                      Text(
                        'Product Purchasing\nGuide',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: isTablet ? 36 : 28,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Source Serif Pro',
                        ),
                      ),
                      SizedBox(
                          height: isTablet ? height * 0.05 : height * 0.04),

                      // Buttons
                      _buildMenuButton(context, 'Toothbrush', isTablet),
                      SizedBox(height: height * 0.02),
                      _buildMenuButton(context, 'Toothpaste', isTablet),
                      SizedBox(height: height * 0.02),
                      // Taller button specifically for Floss & Interdental Aids
                      _buildMenuButton(
                          context, 'Floss &\nInterdental Aids', isTablet,
                          multiline: true, extraHeight: true),
                      SizedBox(height: height * 0.02),
                      _buildMenuButton(context, 'Mouthrinse', isTablet),
                      SizedBox(height: height * 0.02),
                      _buildMenuButton(context, 'Other', isTablet),

                      // Space for nav bar
                      SizedBox(height: height * 0.15),
                    ],
                  ),
                ),
              ),
            ),

            // Full-width navigation bar at bottom
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                width: double.infinity,
                height: isTablet ? 80 : 60,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                child: const BottomNavBar(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Updated menu button with tablet adjustments and extra height option
  Widget _buildMenuButton(BuildContext context, String title, bool isTablet,
      {bool multiline = false, bool extraHeight = false}) {
    // Calculate height based on parameters
    double buttonHeight;
    if (extraHeight) {
      // Extra tall button for the floss & interdental aids
      buttonHeight = isTablet ? 120 : 90;
    } else if (multiline) {
      // Standard multiline button
      buttonHeight = isTablet ? 100 : 80;
    } else {
      // Standard single line button
      buttonHeight = isTablet ? 80 : 60;
    }

    return SizedBox(
      width: double.infinity,
      height: buttonHeight,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white,
          padding: EdgeInsets.symmetric(
            vertical: isTablet ? 20 : 15,
            horizontal: 15,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(isTablet ? 20 : 15),
            side: BorderSide(color: Colors.black, width: isTablet ? 3 : 2),
          ),
          elevation: 0,
        ),
        onPressed: () {},
        child: Text(
          title,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.black,
            fontSize: isTablet ? 28 : 22,
            fontWeight: FontWeight.bold,
            fontFamily: 'Source Serif Pro',
          ),
        ),
      ),
    );
  }
}
