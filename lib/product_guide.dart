import 'package:flutter/material.dart';
import 'dart:math' show min;
import 'bottom_nav_bar.dart';
import 'toothpaste_guide/toothpaste.dart';

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
                        'Product Purchasing\nGuide',
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
                      SizedBox(height: height * 0.02),
                      _buildMenuButton(context, 'Toothpaste', isTablet),
                      SizedBox(height: height * 0.02),
                      _buildMenuButton(
                        context, 'Floss &\nInterdental Aids', isTablet,
                        multiline: true, extraHeight: true),
                      SizedBox(height: height * 0.02),
                      _buildMenuButton(context, 'Mouthrinse', isTablet),
                      SizedBox(height: height * 0.02),
                      _buildMenuButton(context, 'Other', isTablet),
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

  Widget _buildMenuButton(BuildContext context, String title, bool isTablet,
      {bool multiline = false, bool extraHeight = false}) {
    double buttonHeight;
    if (extraHeight) {
      buttonHeight = isTablet ? 120 : 90;
    } else if (multiline) {
      buttonHeight = isTablet ? 100 : 80;
    } else {
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
          }
        },
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
