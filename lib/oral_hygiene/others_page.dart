import 'package:flutter/material.dart';
import '../bottom_nav_bar.dart';

class OtherPage extends StatelessWidget {
  const OtherPage({super.key});

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
              // TODO: Save to favorites (to be implemented)
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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Center(
                child: Icon(Icons.public, size: 60, color: Colors.white),
              ),
              SizedBox(height: 10),
              Center(
                child: Text(
                  'Other',
                  style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontFamily: 'Source Serif Pro',
                  ),
                ),
              ),
              SizedBox(height: 30),
              Text(
                'Oral Probiotics:',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontFamily: 'Source Serif Pro',
                ),
              ),
              Text(
                "Oral probiotics are good bacteria that help keep your mouth healthy by balancing the natural microbiome. They can reduce bad breath, fight harmful bacteria, and even support your gums and teeth.",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  height: 1.4,
                  fontFamily: 'Source Serif Pro',
                ),
              ),
              SizedBox(height: 20),
              Text(
                'Xylitol:',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontFamily: 'Source Serif Pro',
                ),
              ),
              Text(
                "Xylitol is a natural sweetener that’s actually good for your teeth! It helps prevent cavities by reducing the growth of harmful bacteria in your mouth.",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  height: 1.4,
                  fontFamily: 'Source Serif Pro',
                ),
              ),
              SizedBox(height: 20),
              Text(
                'Natural Toothpaste:\nHydroxyapatite',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontFamily: 'Source Serif Pro',
                ),
              ),
              Text(
                "Hydroxyapatite is a natural mineral that helps strengthen and rebuild tooth enamel. It's a safe and effective alternative to fluoride, making it perfect for those seeking a more natural toothpaste option.",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  height: 1.4,
                  fontFamily: 'Source Serif Pro',
                ),
              ),
              SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}