import 'package:flutter/material.dart';
import '../bottom_nav_bar.dart';
import 'how_to_brush_page.dart';
import 'how_to_floss_page.dart';
import 'what_are_interdental_aids_page.dart';
import 'how_to_clean_your_tongue_page.dart';
import 'others_page.dart';


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
                    _buildInfoCard(context, 'Brushing Technique', const HowToBrushPage()),
                    const SizedBox(height: 10),
                    _buildInfoCard(context, 'How to Floss', const HowToFlossPage()),
                    const SizedBox(height: 10),
                    _buildInfoCard(context, 'What are Interdental Aids', const WhatAreInterdentalAidsPage()),
                    const SizedBox(height: 10),
                    _buildInfoCard(context, 'How to Clean Your Tongue', const HowToCleanYourTonguePage()),
                    const SizedBox(height: 10),
                    _buildInfoCard(context, 'Other', const OtherPage()),
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

  Widget _buildInfoCard(BuildContext context, String title, Widget? page) {
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
          if (page != null) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => page),
            );
          }
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
