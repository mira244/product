import 'package:flutter/material.dart';
import 'package:task_mira/presentation/product.dart';

class PProvider extends ChangeNotifier {
  List<Product> _products = [];

  List<Product> get products => _products;

  void addUser(Product product) {
    // log("add user ${product.title}", name: "PProvider");
    // // first solution
    // _users.add(user);
    // _users = _users.map((e) => e).toList();

    // //second solution
    _products = [..._products, product];

    // third solution
    //_products.add(product);
    notifyListeners();
  }
}
