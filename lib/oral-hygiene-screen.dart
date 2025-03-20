import 'package:flutter/material.dart';
import 'dart:math' show min;
import 'bottom_nav_bar.dart';

class OralHygiene extends StatelessWidget {
  const OralHygiene({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final width = screenSize.width;
    final height = screenSize.height;
    final bool isLandscape = width > height;
    final bool isTablet = width > 600;

    return Scaffold(
      backgroundColor: const Color(0xFF0051C1),
      appBar: AppBar(
        backgroundColor: const Color(0xFF0051C1),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white, size: 28),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SafeArea(
        bottom: false,
        child: isLandscape
            ? Row(
                children: [
                  // Left Side: Logo & Title
                  Expanded(
                    flex: 1,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/images/oralHygieneLogo.png',
                          height: height * 0.35,
                        ),
                        const SizedBox(height: 10),
                        const Text(
                          "Oral Hygiene",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 26,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'PT Serif',
                          ),
                        ),
                      ],
                    ),
                  ),

                  // Right Side: Buttons (Scrollable in Landscape)
                  Expanded(
                    flex: 2,
                    child: SingleChildScrollView(
                      padding: EdgeInsets.symmetric(horizontal: width * 0.08),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          _buildMenuButton(context, "How to brush", isTablet),
                          SizedBox(height: height * 0.02),
                          _buildMenuButton(context, "How to floss", isTablet),
                          SizedBox(height: height * 0.02),
                          _buildMenuButton(context, "What are interdental aids", isTablet),
                          SizedBox(height: height * 0.02),
                          _buildMenuButton(context, "How to clean your tongue", isTablet),
                          SizedBox(height: height * 0.02),
                          _buildMenuButton(context, "Other", isTablet),
                        ],
                      ),
                    ),
                  ),
                ],
              )
            : Column(
                children: [
                  // Header with Logo & Title
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: height * 0.03),
                    child: Column(
                      children: [
                        Image.asset(
                          'assets/images/oralHygieneLogo.png',
                          height: height * 0.1,
                        ),
                        const SizedBox(height: 10),
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

                  // Scrollable Buttons in Portrait
                  Expanded(
                    child: ListView(
                      padding: EdgeInsets.symmetric(horizontal: width * 0.08),
                      children: [
                        _buildMenuButton(context, "How to brush", isTablet),
                        _buildMenuButton(context, "How to floss", isTablet),
                        _buildMenuButton(context, "What are interdental aids", isTablet),
                        _buildMenuButton(context, "How to clean your tongue", isTablet),
                        _buildMenuButton(context, "Other", isTablet),
                      ],
                    ),
                  ),
                ],
              ),
      ),
      bottomNavigationBar: const BottomNavBar(),
    );
  }

  // **Reusable Button Widget with Proper Spacing & Responsiveness**
  Widget _buildMenuButton(BuildContext context, String title, bool isTablet) {
    double buttonHeight = isTablet ? 80 : 60;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: SizedBox(
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
            // TODO: Navigate to respective page
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
      ),
    );
  }
}

