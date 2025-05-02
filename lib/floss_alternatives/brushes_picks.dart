
import 'package:flutter/material.dart';
import '../bottom_nav_bar.dart';
// Import your FavoriteItem class

class BrushesPicksPage extends StatelessWidget {
  const BrushesPicksPage({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isTablet = screenWidth > 600;

    return Scaffold(
      backgroundColor: const Color(0xFF0051C1),
      bottomNavigationBar: const BottomNavBar(),
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              padding: EdgeInsets.symmetric(
                horizontal: isTablet ? screenWidth * 0.1 : screenWidth * 0.08,
                vertical: isTablet ? 30 : 20,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Top navigation icons (back + bookmark)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.arrow_back, color: Colors.white),
                        onPressed: () => Navigator.of(context).pop(),
                      ),
                      IconButton(
                        icon: const Icon(Icons.bookmark, color: Colors.white),
                        onPressed: () {
                        },
                      ),
                    ],
                  ),

                  const SizedBox(height: 20),

                  // Floss icon
                  Image.asset(
                    'assets/images/dental_picks.png',  
                    height: isTablet ? 140 : 100,
                  ),

                  const SizedBox(height: 20),

                  // Title
                  const Text(
                    'Floss Alternative \nBrushes & Picks',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 28,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Source Serif Pro',
                    ),
                  ),

                  const SizedBox(height: 30),

                ],
              ),
            );
          },
        ),
      ),
    );
  }
}