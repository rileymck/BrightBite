// Import required Flutter packages and custom pages
import 'package:flutter/material.dart';
import 'package:test_flutter/Other%20Products/tongue_scrapers.dart'; 
import 'dart:math' show min;

import 'bottom_nav_bar.dart';
import 'toothpaste_guide/toothpaste.dart';
import 'toothbrush/toothbrush.dart';
import 'Mouthrisnse/mouthrinse_page.dart';
import 'Other Products/other_products_page.dart';
import 'floss_alternatives/floss_alt.dart';

class ProductGuide extends StatelessWidget {
  const ProductGuide({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final width = screenSize.width;
    final height = screenSize.height;
    final isTablet = width > 600;

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
      bottomNavigationBar: const BottomNavBar(), // ✅ Only one nav bar kept
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
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
                      SizedBox(height: isTablet ? height * 0.08 : height * 0.03),
                      Image.asset(
                        'assets/images/toothbrush_toothpaste_icon.png',
                        width: min(width * 0.15, 120),
                        height: min(width * 0.15, 120),
                        color: Colors.white,
                      ),
                      SizedBox(height: height * 0.02),
                      Text(
                        'Product Purchasing Guide',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: isTablet ? 36 : 28,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Source Serif Pro',
                        ),
                      ),
                      SizedBox(height: isTablet ? height * 0.05 : height * 0.04),
                      _buildMenuButton(context, 'Toothbrush', isTablet, const ToothbrushPage()),
                      SizedBox(height: height * 0.02),
                      _buildMenuButton(context, 'Toothpaste', isTablet, const ToothpasteGuidePage()),
                      SizedBox(height: height * 0.02),
                      _buildMenuButton(
                        context,
                        'Floss & Interdental Aids',
                        isTablet, const FlossAlternativesPage()),
                      SizedBox(height: height * 0.02),
                      _buildMenuButton(context, 'Mouthrinse', isTablet, const MouthrinsePage()),
                      SizedBox(height: height * 0.02),
                      _buildMenuButton(context, 'Other', isTablet, const OtherProductsPage()),
                      SizedBox(height: height * 0.15),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMenuButton(
    BuildContext context,
    String title,
    bool isTablet,
    Widget? page, {
    bool multiline = false,
  }) {
    double buttonHeight = multiline ? (isTablet ? 100 : 90) : (isTablet ? 80 : 70);

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
            fontSize: isTablet ? 30 : 24,
            fontWeight: FontWeight.bold,
            fontFamily: 'Source Serif Pro',
          ),
        ),
      ),
    );
  }
}
