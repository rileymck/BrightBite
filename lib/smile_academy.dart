import 'package:flutter/material.dart';
import 'dart:math' show min;
import 'bottom_nav_bar.dart';
import 'dental_treatment/dental_treatment_page.dart';
import 'oral_hygiene/oral_hygiene_page.dart';
import 'life_stages_page.dart';



class SmileAcademy extends StatelessWidget {
  const SmileAcademy({super.key});

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
          '', // Removed 'Smile Academy' text on top banner
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
      bottomNavigationBar: const BottomNavBar(),
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
                      Icon(
                        Icons.school,
                        size: min(width * 0.15, 120),
                        color: Colors.white,
                      ),
                      SizedBox(height: height * 0.02),
                      Text(
                        'Smile Academy',
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

                      // Larger buttons without icons
                      _buildMenuButton(context, 'Oral Hygiene', isTablet, const OralHygienePage()),
                      SizedBox(height: height * 0.02),
                      _buildMenuButton(context, 'Dental Treatment', isTablet,
                          const DentalTreatmentPage()),
                      SizedBox(height: height * 0.02),
                      _buildMenuButton(context, 'Life Stages', isTablet, const LifeStagesPage()),
                      // Space for nav bar
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

  // Updated menu button with tablet adjustments, no icons, and increased size
  Widget _buildMenuButton(
      BuildContext context, String title, bool isTablet, Widget? page) {
    // Increased button height for both tablet and phone
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
          if (page != null) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => page),
            );
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
