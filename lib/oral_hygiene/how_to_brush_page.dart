// how_to_brush_page.dart
import 'package:flutter/material.dart';
import 'package:hive/hive.dart'; // Import Hive
import 'package:hive_flutter/hive_flutter.dart'; // Import Hive Flutter for ValueListenableBuilder
import '../bottom_nav_bar.dart';
import '../favorite_item.dart'; // Import your FavoriteItem class

class HowToBrushPage extends StatefulWidget {
  const HowToBrushPage({super.key});

  @override
  _HowToBrushPageState createState() => _HowToBrushPageState();
}

class _HowToBrushPageState extends State<HowToBrushPage> {
  bool isFavorite = false; // Track favorite status

  @override
  void initState() {
    super.initState();
    _checkIfFavorite();
  }

  Future<void> _checkIfFavorite() async {
    final box = await Hive.openBox('favorites');
    final favorite = box.values.cast<FavoriteItem>().firstWhere(
        (item) => item.id == 'how_to_brush',
        orElse: () => FavoriteItem(id: '', name: '', imageUrl: ''));

    setState(() {
      isFavorite = favorite.id.isNotEmpty;
    });
  }

  Future<void> _toggleFavorite() async {
    final box = await Hive.openBox('favorites');
    if (isFavorite) {
      // Remove from favorites
      final index = box.values.cast<FavoriteItem>().toList().indexWhere(
          (item) => item.id == 'how_to_brush'); // Find the index
      if (index != -1) {
        await box.deleteAt(index); // Delete the item
      }
    } else {
      // Add to favorites
      final newItem = FavoriteItem(
        id: 'how_to_brush',
        name: 'How to brush',
        imageUrl: 'assets/images/brightbitelogo.png', // Or whatever image you want
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
              _checkIfFavorite(); // Call _checkIfFavorite() here
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