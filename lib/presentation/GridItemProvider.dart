import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:task_mira/presentation/product.dart';

class GridItemProvider with ChangeNotifier {
  List<Product> _items = [
    Product(
        image:
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQNr6IR2JyzFBmzaC4q0f5abF-e6RLIZsKSqpQAkduiz9-8Q1hFsFcrTfe31oVDNKmjHSI&usqp=CAU',
        name: 'Room Sofa',
        description: 'This is product 1 description',
        price: 29.99,
        colors: [Colors.red, Colors.blue],
        isFavorite: false),
    Product(
        image:
            'https://m.media-amazon.com/images/I/61hGsOxdrXL._AC_UF350,350_QL80_.jpg',
        name: 'TV',
        description: 'This is product 2 description',
        price: 39.99,
        colors: [Colors.green, Colors.yellow],
        isFavorite: false),
    Product(
        image:
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQZ625tZiiIPoNP69_OVpi_q0TnMAaUMyul0w&s',
        name: 'lamp',
        description: 'This is product 1 description',
        price: 29.99,
        colors: [Colors.red, Colors.blue],
        isFavorite: false),
    Product(
        image:
            'https://m.media-amazon.com/images/I/91SGVKZfV7L._AC_UF350,350_QL80_.jpg',
        name: 'wood table',
        description: 'This is product 2 description',
        price: 39.99,
        colors: [Colors.green, Colors.yellow],
        isFavorite: false),
  ];

  List<Product> get items => _items;

  void toggleFavorite(int index) {
    _items[index].isFavorite = !_items[index].isFavorite;
    notifyListeners();
  }

  // Widget buildCircle(Color color) {
  // return Container(
  // width: 20,
  //height: 20,
  //decoration: BoxDecoration(color: color, shape: BoxShape.circle),
  //);
  //}
}
