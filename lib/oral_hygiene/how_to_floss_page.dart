// how_to_floss_page.dart
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import '../bottom_nav_bar.dart';
import '../favorite_item.dart';

class HowToFlossPage extends StatefulWidget {
  const HowToFlossPage({super.key});

  @override
  _HowToFlossPageState createState() => _HowToFlossPageState();
}

class _HowToFlossPageState extends State<HowToFlossPage> {
  bool isFavorite = false;

  @override
  void initState() {
    super.initState();
    _checkIfFavorite();
  }

  Future<void> _checkIfFavorite() async {
    final box = await Hive.openBox('favorites');
    final favorite = box.values.cast<FavoriteItem>().firstWhere(
        (item) => item.id == 'how_to_floss',
        orElse: () => FavoriteItem(id: '', name: '', imageUrl: ''));

    setState(() {
      isFavorite = favorite.id.isNotEmpty;
    });
  }

  Future<void> _toggleFavorite() async {
    final box = await Hive.openBox('favorites');
    if (isFavorite) {
      final index = box.values.cast<FavoriteItem>().toList().indexWhere(
          (item) => item.id == 'how_to_floss');
      if (index != -1) {
        await box.deleteAt(index);
      }
    } else {
      final newItem = FavoriteItem(
        id: 'how_to_floss',
        name: 'How to Floss',
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
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Icon(Icons.medical_services, size: 60, color: Colors.white),
              const SizedBox(height: 10),
              const Text(
                'How to Floss',
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
                "Flossing isn’t just an extra step—it’s essential! This quick guide shows how to floss efficiently, ensuring you reach every hidden food particle and prevent gum disease before it starts.",
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
                  'Here are the steps:',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 16,
                    fontFamily: 'Source Serif Pro',
                  ),
                ),
              ),
              const SizedBox(height: 10),
              const _StepLabel(
                  text: 'Wrap the Floss',
                  description:
                      'Take about 18 inches of floss and wrap most of it around one middle finger, winding the rest around the other middle finger.'),
              const _StepLabel(
                  text: 'Grip Firmly',
                  description:
                      'Hold the floss tightly between your thumbs and forefingers.'),
              const _StepLabel(
                  text: 'Slide Gently',
                  description:
                      'Guide the floss between your teeth using a gentle rubbing motion. Avoid snapping it into the gums.'),
              const _StepLabel(
                  text: 'Curve into a C',
                  description:
                      'When you reach the gum line, curve the floss around one tooth and slide it gently under the gumline.'),
              const _StepLabel(
                  text: 'Move Up & Down',
                  description:
                      'Hold the floss against the tooth and move it up and down. Repeat for all teeth, including the back ones.'),
              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}

class _StepLabel extends StatelessWidget {
  final String text;
  final String description;
  const _StepLabel({required this.text, required this.description});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: RichText(
        text: TextSpan(
          style: const TextStyle(
            color: Colors.white,
            fontSize: 16,
            height: 1.5,
            fontFamily: 'Source Serif Pro',
          ),
          children: [
            TextSpan(
              text: '$text – ',
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            TextSpan(text: description),
          ],
        ),
      ),
    );
  }
}