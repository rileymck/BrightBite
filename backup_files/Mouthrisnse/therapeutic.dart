import 'package:flutter/material.dart';
// Import Hive
import 'package:hive_flutter/hive_flutter.dart'; // Import Hive Flutter for ValueListenableBuilder
import '../bottom_nav_bar.dart';
import '../favorite_item.dart'; // Import your FavoriteItem class

class TherapeuticPage extends StatefulWidget {
  const TherapeuticPage({super.key});

  @override
  _TherapeuticPageState createState() => _TherapeuticPageState();
}
class _TherapeuticPageState extends State<TherapeuticPage> {
  bool isFavorite = false;

  @override
  void initState() {
    super.initState();
    _checkIfFavorite();
  }

  Future<void> _checkIfFavorite() async {
    final box = await Hive.openBox('favorites');
    final favorite = box.values.cast<FavoriteItem>().firstWhere(
        (item) => item.id == 'therapeutic',
        orElse: () => FavoriteItem(id: '', name: '', imageUrl: ''));

    setState(() {
      isFavorite = favorite.id.isNotEmpty;
    });
  }

  Future<void> _toggleFavorite() async {
    final box = await Hive.openBox('favorites');
    if (isFavorite) {
      final index = box.values.cast<FavoriteItem>().toList().indexWhere(
          (item) => item.id == 'therapeutic');
      if (index != -1) {
        await box.deleteAt(index);
      }
    } else {
      final newItem = FavoriteItem(
        id: 'therapeutic',
        name: 'Therapeutic',
        imageUrl: 'assets/images/mouthrinse.png', 
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
              Image.asset('assets/images/mouthrinse.png', width: 60, height: 60,),
              const SizedBox(height: 10),
              const Text(
                'Therapeutic Mouthrinse',
                textAlign: TextAlign.center,
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
                    // TODO: Add product link
                  },
                  child: const Text(
                    'insert product image with hyperlink',
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
                  'Product Description:',
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
                "This link takes you to the product.",
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
