import 'package:flutter/material.dart';
import '../bottom_nav_bar.dart';
import 'fluoridated.dart';
import 'non_fluoridated.dart';
import 'sensitivity.dart';
import 'gingivitis.dart';
import 'children.dart';

class ToothpasteGuidePage extends StatelessWidget {
  const ToothpasteGuidePage({super.key});

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
      backgroundColor: const Color(0xFF0051C1),
      bottomNavigationBar: const BottomNavBar(),
      body: SafeArea(
        bottom: false,
        child: LayoutBuilder(
          builder: (context, constraints) {
            final screenWidth = constraints.maxWidth;
            final isTablet = screenWidth > 600;

            return SingleChildScrollView(
              padding: EdgeInsets.symmetric(
                horizontal: isTablet ? screenWidth * 0.15 : screenWidth * 0.08,
                vertical: isTablet ? 30 : 20,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/tooth_toothbrush.png',
                    height: isTablet ? 100 : 80,
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'Toothpaste',
                    style: TextStyle(
                      fontSize: 28,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Source Serif Pro',
                    ),
                  ),
                  const SizedBox(height: 20),
                  _buildGuideButton(context, 'Fluoridated', isTablet),
                  const SizedBox(height: 15),
                  _buildGuideButton(context, 'Non-fluoridated', isTablet),
                  const SizedBox(height: 15),
                  _buildGuideButton(context, 'Sensitivity', isTablet),
                  const SizedBox(height: 15),
                  _buildGuideButton(context, 'Gingivitis', isTablet),
                  const SizedBox(height: 15),
                  _buildGuideButton(context, 'Children', isTablet),
                  const SizedBox(height: 30),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildGuideButton(BuildContext context, String title, bool isTablet) {
    return SizedBox(
      width: double.infinity,
      height: isTablet ? 70 : 60,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white,
          padding: EdgeInsets.symmetric(
            vertical: isTablet ? 22 : 18,
            horizontal: 15,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14),
            side: const BorderSide(color: Colors.black, width: 2),
          ),
        ),
        onPressed: () {
          if (title == 'Fluoridated') {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const FluoridatedToothpastePage(),
              ),
            );
          } else if (title == 'Non-fluoridated') {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const NonFluoridatedToothpastePage(),
              ),
            );
          } else if (title == 'Sensitivity') {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const SensitivityToothpastePage(),
              ),
            );
          } else if (title == 'Gingivitis') {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const GingivitisToothpastePage(),
              ),
            );
          } else if (title == 'Children') {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const ChildrenToothpastePage(),
              ),
            );
          }
        },
        child: Text(
          title,
          style: TextStyle(
            color: Colors.black,
            fontSize: isTablet ? 20 : 18,
            fontWeight: FontWeight.bold,
            fontFamily: 'Source Serif Pro',
          ),
        ),
      ),
    );
  }
}
