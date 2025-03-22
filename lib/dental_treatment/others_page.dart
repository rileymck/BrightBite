import 'package:flutter/material.dart';
import '../bottom_nav_bar.dart';

class OtherDentalTreatmentPage extends StatelessWidget {
  const OtherDentalTreatmentPage({super.key});

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
            icon: const Icon(Icons.bookmark, color: Colors.white),
            onPressed: () {
              // TODO: Save to favorites (optional)
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
                child: Icon(Icons.description, size: 60, color: Colors.white),
              ),
              SizedBox(height: 10),
              Center(
                child: Text(
                  'Others',
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
                'Implants:',
                style: _headerStyle,
              ),
              SizedBox(height: 10),

              Text(
                'Veneers:',
                style: _headerStyle,
              ),
              SizedBox(height: 10),

              Text(
                'Root Canal (Endodontic Therapy):',
                style: _headerStyle,
              ),
              SizedBox(height: 10),

              Text(
                'Orthodontics:',
                style: _headerStyle,
              ),
              SizedBox(height: 10),

              Text(
                'Partials and Dentures:',
                style: _headerStyle,
              ),
              SizedBox(height: 10),

              Text(
                'Teeth Whitening:',
                style: _headerStyle,
              ),
              SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }

  static const TextStyle _headerStyle = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.bold,
    color: Colors.white,
    fontFamily: 'Source Serif Pro',
  );
}
