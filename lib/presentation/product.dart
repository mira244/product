import 'dart:ui';

class Product {
  final String image;
  final String name;
  final String description;
  final double price;
  final List<Color> colors;
  bool isFavorite;

  Product({
    required this.image,
    required this.name,
    required this.description,
    required this.price,
    required this.colors,
  this.isFavorite = false
  });
}
