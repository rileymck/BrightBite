import 'package:flutter/material.dart';
import 'bottom_nav_bar.dart';

class LifeStagesPage extends StatelessWidget {
  const LifeStagesPage({super.key});

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
      bottomNavigationBar: const BottomNavBar(),
      body: SafeArea(
        bottom: false,
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(
            horizontal: isTablet ? screenSize.width * 0.15 : screenSize.width * 0.08,
            vertical: isTablet ? 30 : 20,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Icon(Icons.family_restroom, size: 80, color: Colors.white),
              const SizedBox(height: 10),
              const Text(
                'Life Stages',
                style: TextStyle(
                  fontSize: 28,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Source Serif Pro',
                ),
              ),
              const SizedBox(height: 20),
              _buildStageButton(context, 'Infant'),
              const SizedBox(height: 10),
              _buildStageButton(context, 'Child'),
              const SizedBox(height: 10),
              _buildStageButton(context, 'Teen'),
              const SizedBox(height: 10),
              _buildStageButton(context, 'Adult'),
              const SizedBox(height: 10),
              _buildStageButton(context, 'Senior'),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildStageButton(BuildContext context, String title) {
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
          // TODO: Add navigation or dialogs for each stage
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
