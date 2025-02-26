// Import required Flutter Material Design package
import 'package:flutter/material.dart';
// Import min function for calculating responsive dimensions
import 'dart:math' show min;
// Import custom page widgets that we'll navigate to
import 'smile_academy.dart';
import 'product_guide.dart';




//for hive database for favorite function
import 'package:hive/hive.dart';

final myBox = Hive.box('myBox'); // Access the Hive box

void storeData() {
  myBox.put('key', 'Hello, Hive!'); // Save data
}

void retrieveData() {
  String? value = myBox.get('key'); // Retrieve data
  print(value);
}







// MainPage widget that serves as the main menu screen after the welcome screen
// Using StatelessWidget since this page doesn't need to maintain any state
class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Get the current screen orientation (portrait or landscape)
    final orientation = MediaQuery.of(context).orientation;

    // Create the main container with the app's primary blue background color
    return Container(
      decoration: const BoxDecoration(
        color: Color(0xFF0051C1), // Bright blue background color
      ),
      child: SafeArea(
        // SafeArea ensures content isn't hidden behind system UI elements (notches, status bars)
        child: LayoutBuilder(
          // LayoutBuilder provides us with the parent widget's constraints for responsive design
          builder: (context, constraints) {
            // Get the maximum available width and height from constraints
            final maxWidth = constraints.maxWidth;
            final maxHeight = constraints.maxHeight;
            final isLandscape = orientation == Orientation.landscape;

            // Calculate responsive dimensions that adapt to screen size
            // Each dimension is calculated relative to screen size with maximum limits
            final logoSize = min(
                maxWidth * 0.35,
                min(maxHeight * 0.3,
                    180.0)); // Logo size: 35% of width or 30% of height, max 180
            final titleFontSize = min(
                maxWidth * 0.1,
                min(maxHeight * 0.07,
                    48.0)); // Title: 10% of width or 7% of height, max 48
            final subtitleFontSize = min(
                maxWidth * 0.05,
                min(maxHeight * 0.04,
                    24.0)); // Subtitle: 5% of width or 4% of height, max 24
            final menuHeight = min(
                maxHeight * 0.15,
                min(maxWidth * 0.25,
                    134.0)); // Menu items: 15% of height or 25% of width, max 134
            final spacing =
                maxHeight * 0.02; // Vertical spacing: 2% of screen height

            // Create scrollable content that adapts to screen size
            return SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight:
                      maxHeight, // Ensure content fills at least the full screen height
                ),
                child: IntrinsicHeight(
                  // IntrinsicHeight helps with proper vertical sizing of content
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: spacing,
                      horizontal: maxWidth *
                          0.05, // Horizontal padding of 5% screen width
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Spacer(
                            flex: 2), // Flexible space at top of screen
                        // App title "BrightBite"
                        RichText(
                          text: TextSpan(
                            text: 'BrightBite',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: titleFontSize,
                              fontFamily: 'PT Serif',
                              fontWeight: FontWeight.w700,
                              decoration: TextDecoration
                                  .none, // Remove any text decoration
                            ),
                          ),
                        ),
                        SizedBox(height: spacing), // Vertical spacing
                        // App logo
                        SizedBox(
                          width: logoSize,
                          height: logoSize,
                          child: Image.asset(
                            'assets/images/brightbitelogo.png',
                            fit: BoxFit
                                .contain, // Scale image to fit while maintaining aspect ratio
                          ),
                        ),
                        SizedBox(height: spacing),
                        // App tagline
                        RichText(
                          text: TextSpan(
                            text: 'Smile Tips at Your Fingertips',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: subtitleFontSize,
                              fontFamily: 'Source Serif Pro',
                              fontWeight: FontWeight.w700,
                              decoration: TextDecoration.none,
                            ),
                          ),
                        ),
                        SizedBox(height: spacing * 2),
                        // Smile Academy button with Material icon
                        _buildMenuItem(
                          context: context,
                          title: 'Smile Academy',
                          icon: Icons.school, // Using Material school icon
                          height: menuHeight,
                          maxWidth: maxWidth,
                          maxHeight: maxHeight,
                          onTap: () {
                            // Navigate to Smile Academy page when tapped
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const SmileAcademy(),
                              ),
                            );
                          },
                        ),
                        SizedBox(height: spacing),
                        // Product Guide button with custom PNG image
                        _buildMenuItemWithImage(
                          context: context,
                          title: 'Product Guide',
                          imagePath:
                              'assets/images/toothbrush_toothpaste_icon.png',
                          height: menuHeight,
                          maxWidth: maxWidth,
                          maxHeight: maxHeight,
                          onTap: () {
                            // Navigate to Product Guide page when tapped
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const ProductGuide(),
                              ),
                            );
                          },
                        ),
                        const Spacer(
                            flex: 3), // Flexible space at bottom of screen
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  // Helper method to build menu items with Material icons (used for Smile Academy)
  Widget _buildMenuItem({
    required BuildContext context,
    required String title,
    required IconData icon,
    required double height,
    required double maxWidth,
    required double maxHeight,
    required VoidCallback onTap,
  }) {
    // Calculate responsive dimensions for the menu item
    final iconSize = min(
        height * 0.3,
        min(maxWidth * 0.08,
            40.0)); // Icon size: 30% of height or 8% of width, max 40
    final fontSize = min(
        height * 0.25,
        min(maxWidth * 0.06,
            32.0)); // Font size: 25% of height or 6% of width, max 32
    final borderWidth =
        min(height * 0.05, 11.0); // Border width: 5% of height, max 11

    // Create a touchable container with icon and text
    return GestureDetector(
      onTap: onTap, // Handle tap/click events
      child: Container(
        width: double.infinity, // Container takes full available width
        height: height,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(min(
              height * 0.07, 10.0)), // Rounded corners: 7% of height, max 10
          border: Border.all(
            width: borderWidth,
            color: Colors.black,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Material Design icon
            Icon(
              icon,
              size: iconSize,
              color: Colors.black,
            ),
            SizedBox(
                height: height *
                    0.05), // Space between icon and text: 5% of menu item height
            // Menu item text
            RichText(
              text: TextSpan(
                text: title,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: fontSize,
                  fontFamily: 'Source Serif Pro',
                  fontWeight: FontWeight.w700,
                  decoration: TextDecoration.none,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Helper method to build menu items with custom PNG images (used for Product Guide)
  // This method is similar to _buildMenuItem but uses Image.asset instead of Icon
  Widget _buildMenuItemWithImage({
    required BuildContext context,
    required String title,
    required String imagePath,
    required double height,
    required double maxWidth,
    required double maxHeight,
    required VoidCallback onTap,
  }) {
    // Use same calculations as _buildMenuItem for consistency
    final iconSize = min(height * 0.3, min(maxWidth * 0.08, 40.0));
    final fontSize = min(height * 0.25, min(maxWidth * 0.06, 32.0));
    final borderWidth = min(height * 0.05, 11.0);

    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        height: height,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(min(height * 0.07, 10.0)),
          border: Border.all(
            width: borderWidth,
            color: Colors.black,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Custom PNG image instead of Material icon
            Image.asset(
              imagePath,
              width: iconSize,
              height: iconSize,
              fit: BoxFit.contain,
            ),
            SizedBox(height: height * 0.05),
            RichText(
              text: TextSpan(
                text: title,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: fontSize,
                  fontFamily: 'Source Serif Pro',
                  fontWeight: FontWeight.w700,
                  decoration: TextDecoration.none,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
