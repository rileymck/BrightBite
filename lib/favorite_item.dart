import 'package:hive/hive.dart';

part 'favorite_item.g.dart'; // Auto-generated file for adapters

@HiveType(typeId: 0)
class FavoriteItem {
  @HiveField(0)
  final String id;

  @HiveField(1)
  final String name;

  @HiveField(2)
  final String imageUrl;

  FavoriteItem({required this.id, required this.name, required this.imageUrl});
}
