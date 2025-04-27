import 'package:flutter/material.dart';
import '../bottom_nav_bar.dart';
import '../favorite_item.dart'; // Import your FavoriteItem class


class FluoridatedToothpastePage extends StatelessWidget {
  const FluoridatedToothpastePage({super.key});

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
                  // Top bar with back and favorite icons
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
                          // TODO: handle bookmarking
                        },
                      ),
                    ],
                  ),

                  const SizedBox(height: 10),

                  // Toothbrush image
                  Image.asset(
                    'assets/images/manual_toothbrush.png',
                    height: isTablet ? 100 : 80,
                  ),

                  const SizedBox(height: 15),

                  // Title
                  const Text(
                    'Fluoridated\nToothpaste',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 26,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Source Serif Pro',
                    ),
                  ),

                  const SizedBox(height: 15),

                  // Description text
                  const Text(
                    "Fluoride’s Role in Oral Health: Fluoride helps protect teeth by repairing early damage and preventing cavities. It strengthens enamel, reduces acid production, and makes it harder for bacteria to stick to teeth. Learn more at the CDC.\n\nhttps://www.cdc.gov/oralhealth/index.html.",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      height: 1.5,
                      fontFamily: 'Source Serif Pro',
                    ),
                    textAlign: TextAlign.justify,
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
