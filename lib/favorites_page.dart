import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import '../favorite_item.dart'; // Import your FavoriteItem class

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
                title: Text(item.name), // Display the name
                leading: Image.asset(item.imageUrl, width: 50, height: 50),//display image
                trailing: IconButton(
                  icon: const Icon(Icons.delete, color: Colors.red),
                  onPressed: () {
                    box.deleteAt(index);//delete using index.
                  },
                ),
              );
            },
          );
        },
      ),
    );
  }
}