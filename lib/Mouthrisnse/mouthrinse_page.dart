import 'cosmetic.dart';
import 'speciality.dart';
import 'therapeutic.dart';
import 'package:flutter/material.dart';
import '../../bottom_nav_bar.dart';


class MouthrinsePage extends StatelessWidget {
  const MouthrinsePage({super.key});

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
                     Image.asset('assets/images/mouthrinse.png', width: 60, height: 60,),
                    const SizedBox(height: 10),
                    const Text(
                      'Mouthrinse',
                      style: TextStyle(
                        fontSize: 28,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Source Serif Pro',
                      ),
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      'Learn the differences in Mouthrinse!',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                        fontFamily: 'Source Serif Pro',
                      ),
                    ),
                    const SizedBox(height: 20),
                    _buildInfoCard(context, 'Therapeutic', const TherapeuticPage()),
                    const SizedBox(height: 10),
                    _buildInfoCard(context, 'Cosmetic', const CosmeticPage()),
                    const SizedBox(height: 10),
                    _buildInfoCard(context, 'Specialty', const SpecialtyPage()),
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
