import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_mira/presentation/GridItemProvider.dart';
import 'package:task_mira/presentation/product_grid_screen.dart';
//import 'package:task_mira/presentation/products_screen.dart';

// void main() {
//   runApp(MaterialApp(home: ProductGridScreen()));
// }
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => GridItemProvider(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: ProductGridScreen(),
      ),
    );
  }
}