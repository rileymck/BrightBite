import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import '../favorite_item.dart';
import '../oral_hygiene/how_to_brush_page.dart'; // Import the HowToBrushPage

class FavoritesPage extends StatelessWidget {
  const FavoritesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF0051C1),
      appBar: AppBar(title: const Text('Favorites')),
      body: ValueListenableBuilder(
        valueListenable: Hive.box('favorites').listenable(),
        builder: (context, Box box, _) {
          List<FavoriteItem> favoriteItems = box.values.toList().cast<FavoriteItem>();

          if (favoriteItems.isEmpty) {
            return const Center(child: Text("No favorites yet!"));
          }

          return ListView.builder(
            itemCount: favoriteItems.length,
            itemBuilder: (context, index) {
              final item = favoriteItems[index];
              return ListTile(
                title: Text(item.name),
                leading: Image.asset(item.imageUrl, width: 50, height: 50),
                trailing: IconButton(
                  icon: const Icon(Icons.delete, color: Colors.red),
                  onPressed: () {
                    box.deleteAt(index);
                  },
                ),
                onTap: () {
                  // Navigate to the corresponding page based on the item's ID
                  if (item.id == 'how_to_brush') {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const HowToBrushPage()),
                    );
                  }
                  // Add more conditions for other pages if needed
                },
              );
            },
          );
        },
      ),
    );
  }
}