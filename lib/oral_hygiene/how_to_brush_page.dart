import 'package:flutter/material.dart';
import '../bottom_nav_bar.dart';

class HowToBrushPage extends StatelessWidget {
  const HowToBrushPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0051C1),
      appBar: AppBar(
        backgroundColor: const Color(0xFF0051C1),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.bookmark_border, color: Colors.white),
            onPressed: () {
              // Optional: Save to favorites
            },
          ),
        ],
      ),
      bottomNavigationBar: const BottomNavBar(),
      body: SafeArea(
        bottom: false,
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Icon(Icons.brush, size: 60, color: Colors.white),
              const SizedBox(height: 10),
              const Text(
                'How to brush',
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontFamily: 'Source Serif Pro',
                ),
              ),
              const SizedBox(height: 20),

              // Watch Video Button
              SizedBox(
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
                    // TODO: Add video player
                  },
                  child: const Text(
                    'Watch Video',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontFamily: 'Source Serif Pro',
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),

              // Video Description
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Video Description:',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 16,
                    fontFamily: 'Source Serif Pro',
                  ),
                ),
              ),
              const SizedBox(height: 5),
              const Text(
                "Think you’re brushing correctly? You might be surprised! This video teaches the Bass Technique, a dentist-approved method that removes plaque and keeps your gums healthy. Watch, learn, and upgrade your brushing game!",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  height: 1.4,
                  fontFamily: 'Source Serif Pro',
                ),
              ),
              const SizedBox(height: 20),

              // Steps Title
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Here are the Steps:',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 16,
                    fontFamily: 'Source Serif Pro',
                  ),
                ),
              ),
              const SizedBox(height: 10),

              // Steps
              const _BulletPoint(
                  text: 'Place your toothbrush at a 45-degree angle to the gums.'),
              const _BulletPoint(
                  text:
                      'Gently move the brush back and forth in short (tooth-wide) strokes.'),
              const _BulletPoint(
                  text:
                      'Brush the outer surfaces, the inner surfaces, and the chewing surfaces of the teeth.'),
              const _BulletPoint(
                  text:
                      'To clean the inside surfaces of the front teeth, tilt the brush vertically and make several up-and-down strokes.'),
              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}

// Reusable bullet point widget
class _BulletPoint extends StatelessWidget {
  final String text;
  const _BulletPoint({required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("• ", style: TextStyle(color: Colors.white, fontSize: 16)),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
                height: 1.5,
                fontFamily: 'Source Serif Pro',
              ),
            ),
          ),
        ],
      ),
    );
  }
}
