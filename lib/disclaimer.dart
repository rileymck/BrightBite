import 'package:flutter/material.dart';
import 'dart:math' show min; // Import min function for responsive sizing
import 'package:test_flutter/main_page.dart'; // Import main page for navigation

// DisclaimerPage widget - handles the disclaimer screen of the app
class DisclaimerPage extends StatelessWidget {
  const DisclaimerPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Get the current screen orientation to adjust layout accordingly
    final orientation = MediaQuery.of(context).orientation;
    final isLandscape = orientation ==
        Orientation.landscape; // Check if device is in landscape mode

    return Scaffold(
      // Set white background for the entire page
      backgroundColor: Colors.white,
      // No app bar is used to match the design in the screenshot
      appBar: null,
      body: SafeArea(
        // SafeArea prevents content from being hidden behind system UI elements
        child: LayoutBuilder(
          // LayoutBuilder provides constraints for responsive sizing
          builder: (context, constraints) {
            // Get maximum available width and height from constraints
            final maxWidth = constraints.maxWidth;
            final maxHeight = constraints.maxHeight;

            // Calculate responsive dimensions that adapt to screen size and orientation
            // Container dimensions - different values for landscape/portrait
            final containerWidth =
                isLandscape ? maxWidth * 0.85 : maxWidth * 0.92;
            final containerHeight = isLandscape
                ? maxHeight * 0.75
                : null; // Fixed height only in landscape

            // Text sizing - scales with screen width but has maximum sizes
            final titleFontSize =
                min(maxWidth * 0.06, 32.0); // Disclaimer title in blue box
            final bodyFontSize = min(maxWidth * 0.035, 16.0); // Body text

            // Button dimensions - larger in landscape to prevent squishing
            final buttonWidth =
                isLandscape ? maxWidth * 0.5 : containerWidth * 0.85;
            final buttonHeight =
                isLandscape ? maxHeight * 0.12 : maxHeight * 0.07;
            final buttonFontSize = min(maxWidth * 0.05, 22.0); // Button text

            // Main layout structure using Column
            return Column(
              children: [
                // Back button at the top left (no title as requested)
                Padding(
                  padding: const EdgeInsets.only(top: 10, bottom: 5, left: 8),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: IconButton(
                      icon: const Icon(Icons.arrow_back),
                      onPressed: () {
                        // Navigate back to previous screen
                        Navigator.pop(context);
                      },
                    ),
                  ),
                ),
                // Main content area - wrapped in Expanded + SingleChildScrollView for scrollability
                Expanded(
                  child: SingleChildScrollView(
                    child: Center(
                      child: Column(
                        children: [
                          // Spacing above the blue container
                          SizedBox(
                              height: isLandscape
                                  ? maxHeight * 0.01
                                  : maxHeight * 0.02),

                          // Blue container with rounded corners - contains the disclaimer text
                          Container(
                            width: containerWidth,
                            height:
                                containerHeight, // Will be null in portrait (auto height)
                            padding: EdgeInsets.all(
                                maxWidth * 0.04), // Responsive padding
                            decoration: BoxDecoration(
                              color: const Color(0xFF0051C1), // BrightBite blue
                              borderRadius:
                                  BorderRadius.circular(20), // Rounded corners
                            ),
                            // Add SingleChildScrollView inside container to make text scrollable
                            child: SingleChildScrollView(
                              child: Column(
                                children: [
                                  // "Disclaimer" title inside the blue container
                                  Text(
                                    'Disclaimer',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: titleFontSize,
                                      fontFamily: 'Source Serif Pro',
                                      fontWeight: FontWeight.w700, // Bold
                                    ),
                                  ),
                                  // Space between title and content
                                  SizedBox(height: maxHeight * 0.02),

                                  // The actual disclaimer text content
                                  Text(
                                    'The information, content, and videos provided in this app are for educational purposes only and do not constitute medical or dental advice. We are not promoting or advertising any specific products, brands, or channels.\n\nAll content has been reviewed and suggested by Whitney Haddad RDH, a licensed dental hygienist with over 10 years of experience, to help you better understand and improve your oral health. However, this content should not be used as a substitute for professional dental or medical care. Always consult with your dentist or healthcare provider regarding any dental or oral health concerns.\n\nThe creators, developers, and contributors of this app assume no liability or responsibility for any injury, loss, or damage incurred as a result of any use or reliance upon the information and material contained within it. By using this app, you acknowledge and agree that any actions you take based on the information provided are at your own risk.\n\nThis app requires an internet connection to function properly. Some features, particularly videos, may be limited or unavailable without internet connectivity.\n\nVideos are connected to YouTube, and we are not affiliated with any of the creators or any advertisements that may appear on these videos. These videos were included strictly as additional educational content. At the time of selection, all videos were vetted for reliable information that we believed would be valuable to our users. However, video content may change over time, and we cannot guarantee the continued accuracy or appropriateness of linked content.',
                                    style: TextStyle(
                                      color: Colors
                                          .white, // White text on blue background
                                      fontSize: bodyFontSize,
                                      fontFamily: 'Source Serif Pro',
                                      fontWeight:
                                          FontWeight.w400, // Regular weight
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),

                          // Space between blue container and button
                          SizedBox(
                              height: isLandscape
                                  ? maxHeight * 0.03
                                  : maxHeight * 0.03),

                          // "I Understand" button with gray background and black border
                          Container(
                            width: buttonWidth,
                            height: buttonHeight,
                            decoration: BoxDecoration(
                              color: const Color(
                                  0xFFD9D9D9), // Light gray background
                              borderRadius:
                                  BorderRadius.circular(16), // Rounded corners
                              border: Border.all(
                                color: Colors.black,
                                width: 2, // Thick black border
                              ),
                            ),
                            // InkWell provides tap/click effect
                            child: InkWell(
                              onTap: () {
                                // Navigate to MainPage and remove DisclaimerPage from navigation stack
                                // pushReplacement prevents going back to this screen with back button
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const MainPage()),
                                );
                              },
                              child: Center(
                                // Button text
                                child: Text(
                                  'I Understand',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: buttonFontSize,
                                    fontFamily: 'Source Serif Pro',
                                    fontWeight: FontWeight.w700, // Bold
                                  ),
                                ),
                              ),
                            ),
                          ),

                          // Space at bottom of page
                          SizedBox(
                              height: isLandscape
                                  ? maxHeight * 0.03
                                  : maxHeight * 0.02),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
