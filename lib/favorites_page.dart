// favorites_page.dart
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:test_flutter/toothbrush/toothbrush.dart';
import '../favorite_item.dart';

//favorite page link to actual page
import '../oral_hygiene/how_to_brush_page.dart';
import '../oral_hygiene/how_to_clean_your_tongue_page.dart';
import '../oral_hygiene/how_to_floss_page.dart';
import '../oral_hygiene/what_are_interdental_aids_page.dart';
import '../oral_hygiene/others_page.dart'; 

import '../dental_treatment/preventative_care_page.dart';
import '../dental_treatment/composite_fillings_page.dart';
import '../dental_treatment/crowns_page.dart';
import '../dental_treatment/extractions_page.dart';
import '../dental_treatment/others_page.dart';

// import 'toothbrush_page/toothbrush.dart';
import '../toothbrush/manual_toothbrush_page.dart';
import '../toothbrush/electric_toothbrush_page.dart';
import '../toothbrush/infant_toothbrush_page.dart';

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
                  } else if (item.id == 'how_to_clean_tongue') {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const HowToCleanYourTonguePage()),
                    );
                  } else if (item.id == 'how_to_floss') {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const HowToFlossPage()),
                    );
                  } else if (item.id == 'what_are_interdental_aids') {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const WhatAreInterdentalAidsPage()),
                    );
                  } else if (item.id == 'other_page') {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const OtherPage()),
                    );
                  } else if (item.id == 'preventative_care') {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const PreventativeCarePage()),
                    );
                  } else if (item.id == 'composite_fillings') {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const CompositeFillingsPage()),
                    );
                  } else if (item.id == 'crowns') {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const CrownsPage()),
                    );
                  } else if (item.id == 'extractions') { // Add this condition
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const ExtractionsPage()),
                    );
                  } else if (item.id == 'dental_treatment') { // Add this condition
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const OtherDentalTreatmentPage()),
                    );
                  } else if (item.id == 'toothbrush') { // Add this condition
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const ToothbrushPage()),
                    );
                  }else if (item.id == 'manual_toothbrush') { // Add this condition
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const ManualToothbrushPage()),
                    );
                  }
                },
              );
            },
          );
        },
      ),
    );
  }
}