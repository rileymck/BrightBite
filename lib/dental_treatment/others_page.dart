// other_dental_treatment_page.dart
import 'package:flutter/material.dart';
import '../bottom_nav_bar.dart';

import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import '../favorite_item.dart';

class OtherDentalTreatmentPage extends StatefulWidget {
  const OtherDentalTreatmentPage({super.key});

  @override
  _OtherDentalTreatmentPageState createState() =>
      _OtherDentalTreatmentPageState();
}

class _OtherDentalTreatmentPageState extends State<OtherDentalTreatmentPage> {
  bool isFavorite = false;

  @override
  void initState() {
    super.initState();
    _checkIfFavorite();
  }

  Future<void> _checkIfFavorite() async {
    final box = await Hive.openBox('favorites');
    final favorite = box.values.cast<FavoriteItem>().firstWhere(
        (item) => item.id == 'dental_treatment',
        orElse: () => FavoriteItem(id: '', name: '', imageUrl: ''));

    setState(() {
      isFavorite = favorite.id.isNotEmpty;
    });
  }

  Future<void> _toggleFavorite() async {
    final box = await Hive.openBox('favorites');
    if (isFavorite) {
      final index = box.values
          .cast<FavoriteItem>()
          .toList()
          .indexWhere((item) => item.id == 'dental_treatment');
      if (index != -1) {
        await box.deleteAt(index);
      }
    } else {
      final newItem = FavoriteItem(
        id: 'dental_treatment',
        name: 'Dental Treatment',
        imageUrl: 'assets/images/brightbitelogo.png',
      );
      await box.add(newItem);
    }

    setState(() {
      isFavorite = !isFavorite;
    });
  }

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
          ValueListenableBuilder(
            valueListenable: Hive.box('favorites').listenable(),
            builder: (context, Box box, _) {
              _checkIfFavorite();
              return IconButton(
                icon: Icon(
                  isFavorite ? Icons.bookmark : Icons.bookmark_border,
                  color: Colors.white,
                ),
                onPressed: _toggleFavorite,
              );
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
            children: [
              Center(
                child: Image.asset(
                  'assets/images/other_treatment.png', //image asset
                  width: 60,
                  height: 60,
                  color: Colors.white, // Remove if you don't want white tint
                  fit: BoxFit.contain,
                ),
              ),
              const SizedBox(height: 10),
              const Center(
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
              const SizedBox(height: 30),
              const Text(
                'Implants:',
                style: _headerStyle,
              ),
              const SizedBox(height: 10),
              const Text(
                'Veneers:',
                style: _headerStyle,
              ),
              const SizedBox(height: 10),
              const Text(
                'Root Canal (Endodontic Therapy):',
                style: _headerStyle,
              ),
              const SizedBox(height: 10),
              const Text(
                'Orthodontics:',
                style: _headerStyle,
              ),
              const SizedBox(height: 10),
              const Text(
                'Partials and Dentures:',
                style: _headerStyle,
              ),
              const SizedBox(height: 10),
              const Text(
                'Teeth Whitening:',
                style: _headerStyle,
              ),
              const SizedBox(height: 30),
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
