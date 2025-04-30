// Import required Flutter packages and custom pages
import 'package:flutter/material.dart';
import 'package:test_flutter/Other%20Products/tongue_scrapers.dart';
import 'dart:math' show min;
import 'bottom_nav_bar.dart';
import 'toothpaste_guide/toothpaste.dart';
import 'toothbrush/toothbrush.dart';
import 'Mouthrisnse/mouthrinse_page.dart';
import 'Other Products/other_products_page.dart';
// Need to create or import a FlossAlternativesPage component
// import 'floss/floss_alternatives_page.dart';

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
      // App bar configuration
      appBar: AppBar(
        title: const Text(
          '', // Removed 'Smile Academy' text on top banner
          style: TextStyle(
            fontFamily: 'Source Serif Pro',
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: const Color(0xFF0051C1), // Brand blue color
        elevation: 0, // No shadow
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(), // Back navigation
        ),
      ),
      backgroundColor: const Color(0xFF0051C1), // Background color
      bottomNavigationBar: const BottomNavBar(), // Custom bottom navigation
      body: SafeArea(
        bottom: false,
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

                      // Page title
                      Text(
                        'Product Purchasing Guide', // Changed from 'Product Guide' to 'Product Purchasing Guide'
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: isTablet ? 36 : 28,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Source Serif Pro',
                        ),
                      ),
                      SizedBox(height: isTablet ? height * 0.05 : height * 0.04),
                      _buildMenuButton(context, 'Toothbrush', isTablet),

                      SizedBox(height: isTablet ? height * 0.05 : height * 0.04),

                      // Larger buttons without icons
                      _buildMenuButton(context, 'Toothbrush', isTablet, const ToothbrushPage()),
                      SizedBox(height: height * 0.02),

                      _buildMenuButton(context, 'Mouthrinse', isTablet,
                          const MouthrinsePage()),
                      SizedBox(height: height * 0.02),
                      _buildMenuButton(context, 'Other', isTablet, const OtherProductsPage()),
                      // Space for nav bar
                      SizedBox(height: height * 0.15),
                    ],
                  ),
                ),
              ),
            ),
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

  // Updated menu button with tablet adjustments, no icons, and increased size
  Widget _buildMenuButton(
    BuildContext context,
    String title,
    bool isTablet,
    Widget? page,
  ) {
    // Adjust button height based on content
    double buttonHeight = isTablet ? 100 : 80;

    return SizedBox(
      width: double.infinity,
      height: buttonHeight,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white,
          padding: EdgeInsets.symmetric(
            vertical: isTablet ? 25 : 20,
            horizontal: 15,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(isTablet ? 20 : 15),
            side: BorderSide(color: Colors.black, width: isTablet ? 3 : 2),
          ),
          elevation: 0,
        ),
        onPressed: () {
          if (title == 'Toothpaste') {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const ToothpasteGuidePage(),
              ),
            );
          } else {
            debugPrint('$title button pressed');

            if (page != null) {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => page),
              );
            }
          }
        },
        child: Text(
          title,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.black,
            fontSize: isTablet ? 30 : 24, // Increased font size
            fontWeight: FontWeight.bold,
            fontFamily: 'Source Serif Pro',
          ),
        ),
      ),
    );
  }
}
