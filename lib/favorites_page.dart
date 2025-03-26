import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

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
          List<String> favoriteItems = List<String>.from(box.get('favorites', defaultValue: <String>[]));

          if (favoriteItems.isEmpty) {
            return const Center(child: Text("No favorites yet!"));
          }

          return ListView.builder(
            itemCount: favoriteItems.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(favoriteItems[index]),
                trailing: IconButton(
                  icon: const Icon(Icons.delete, color: Colors.red),
                  onPressed: () {
                    favoriteItems.removeAt(index);
                    box.put('favorites', favoriteItems); // Update Hive
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
