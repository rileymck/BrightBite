import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import '../bottom_nav_bar.dart';
import '../favorite_item.dart';

class OtherPage extends StatefulWidget {
  const OtherPage({super.key});

  @override
  _OtherPageState createState() => _OtherPageState();
}

class _OtherPageState extends State<OtherPage> {
  bool isFavorite = false;

  @override
  void initState() {
    super.initState();
    _checkIfFavorite();
  }

  Future<void> _checkIfFavorite() async {
    final box = await Hive.openBox('favorites');
    final favorite = box.values.cast<FavoriteItem>().firstWhere(
        (item) => item.id == 'other_page',
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
          .indexWhere((item) => item.id == 'other_page');
      if (index != -1) {
        await box.deleteAt(index);
      }
    } else {
      final newItem = FavoriteItem(
        id: 'other_page',
        name: 'Other',
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
                  'assets/images/tooth_bacteria.png', // Use your image path here
                  width: 60,
                  height: 60,
                  color: Colors.white, // Remove if you don't want white tint
                  fit: BoxFit.contain,
                ),
              ),
              const SizedBox(height: 10),
              const Center(
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
              const SizedBox(height: 30),
              const Text(
                'Oral Probiotics:',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontFamily: 'Source Serif Pro',
                ),
              ),
              const Text(
                "Oral probiotics are good bacteria that help keep your mouth healthy by balancing the natural microbiome. They can reduce bad breath, fight harmful bacteria, and even support your gums and teeth.",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  height: 1.4,
                  fontFamily: 'Source Serif Pro',
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                'Xylitol:',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontFamily: 'Source Serif Pro',
                ),
              ),
              const Text(
                "Xylitol is a natural sweetener that's actually good for your teeth! It helps prevent cavities by reducing the growth of harmful bacteria in your mouth.",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  height: 1.4,
                  fontFamily: 'Source Serif Pro',
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                'Natural Toothpaste:\nHydroxyapatite',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontFamily: 'Source Serif Pro',
                ),
              ),
              const Text(
                "Hydroxyapatite is a natural mineral that helps strengthen and rebuild tooth enamel. It's a safe and effective alternative to fluoride, making it perfect for those seeking a more natural toothpaste option.",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  height: 1.4,
                  fontFamily: 'Source Serif Pro',
                ),
              ),
              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}
