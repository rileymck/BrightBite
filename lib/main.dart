// Import the material package which contains the widgets and tools needed for the app
import 'package:flutter/material.dart';
import 'dart:math' show min; // Import min function for calculating dimensions

// Main function that runs the app
void main() {
  runApp(const BrightBiteApp());
}

// Root widget of the app
class BrightBiteApp extends StatelessWidget {
  const BrightBiteApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // Removes the debug banner
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: const Color.fromARGB(255, 18, 32, 47),
      ),
      home: const Scaffold(
        // Scaffold widget to build the app's layout
        body: SafeArea(
          // SafeArea widget to avoid overlapping with system UI
          child: WelcomeScreen(), // Display the welcome screen
        ),
      ),
    );
  }
}

// Welcome screen widget that displays the app's initial screen
class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Get the screen size and orientation
    final size = MediaQuery.of(context).size;
    final orientation = MediaQuery.of(context).orientation;
    // Return the welcome screen with responsive design
    return Container(
      decoration: const BoxDecoration(
        // Add a background color
        color: Color(0xFF0051C1), // Bright blue color
      ),
      child: SafeArea(
        // SafeArea widget to avoid overlapping with system UI
        child: LayoutBuilder(
          // LayoutBuilder to get constraints
          builder: (context, constraints) {
            // Calculate responsive dimensions
            final maxWidth = constraints.maxWidth; // Get the maximum width
            final maxHeight = constraints.maxHeight; // Get the maximum height
            final isLandscape =
                orientation == Orientation.landscape; // Check if landscape
            // Return the welcome screen content
            return SingleChildScrollView(
              // SingleChildScrollView to avoid overflow
              child: Container(
                // Use constraints instead of size for more accurate dimensions
                width: maxWidth, // Set the width to the maximum width
                height: isLandscape ? maxHeight : maxHeight,
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: maxHeight * 0.02,
                    horizontal: maxWidth * 0.05,
                  ),
                  child: Column(
                    // Column to stack widgets vertically
                    mainAxisAlignment:
                        MainAxisAlignment.center, // Center vertically
                    children: [
                      const Spacer(flex: 3), // Add flexible space
                      Text(
                        'BrightBite',
                        style: TextStyle(
                          color: Colors.white, // White text color
                          fontSize: min(maxWidth * 0.1, 48), // Adjusted scale
                          fontFamily: 'PT Serif', // Custom font
                          fontWeight: FontWeight.w700, // Bold font weight
                        ),
                      ),
                      SizedBox(height: maxHeight * 0.02),
                      Image.asset(
                        'assets/images/brightbitelogo.png', // Add the logo image
                        width: min(maxWidth * 0.35, 180), // Adjusted scale
                        height: min(maxWidth * 0.35, 180),
                        fit: BoxFit.contain,
                      ),
                      SizedBox(height: maxHeight * 0.02),
                      Text(
                        'Smile Tips at Your Fingertips',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: min(maxWidth * 0.05, 24), // Adjusted scale
                          fontFamily: 'Source Serif Pro',
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      SizedBox(height: maxHeight * 0.03),
                      _buildGetStartedButton(
                        // Call the button function
                        context,
                        width: min(maxWidth * 0.5, 250), // Adjusted width
                        height: min(
                            maxHeight *
                                0.08, // Height relative to screen height
                            56), // Height relative to screen height
                        fontSize:
                            min(maxWidth * 0.045, 20), // Adjusted font size
                      ),
                      const Spacer(flex: 4),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  // Function to build the Get Started button
  Widget _buildGetStartedButton(
    BuildContext context, {
    required double width,
    required double height,
    required double fontSize,
  }) {
    return Container(
      width: width, // Set the width
      height: height, // Set the height
      decoration: BoxDecoration(
        color: Colors.white, // White button color
        borderRadius: BorderRadius.circular(// Responsive border radius
            min(height * 0.2, 10)), // Responsive border radius
        border: Border.all(
          color: Colors.black, // Black border color
          width: min(height * 0.08, 4), // Responsive border width
        ),
      ),
      child: TextButton(
        onPressed: () {
          // Navigation logic to the main page to be added here!
        },
        style: TextButton.styleFrom(
          padding: EdgeInsets.zero, // Remove default padding
          minimumSize: Size.zero, // Remove minimum size constraints
          tapTargetSize:
              MaterialTapTargetSize.shrinkWrap, // Remove tap target padding
        ),
        child: Center(
          child: Text(
            'Get Started',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.black,
              fontSize: fontSize,
              fontFamily: 'Source Serif Pro',
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      ),
    );
  }
}
