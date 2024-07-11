import 'package:flutter/material.dart';
import 'package:task_mira/presentation/product.dart';
//import 'product_model.dart';
import 'product_details.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ProductGridScreen(),
    );
  }
}

class ProductGridScreen extends StatefulWidget {
  @override
  _ProductGridScreenState createState() => _ProductGridScreenState();
}

class _ProductGridScreenState extends State<ProductGridScreen> {
  List<Product> products = [
    Product(
      image:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQNr6IR2JyzFBmzaC4q0f5abF-e6RLIZsKSqpQAkduiz9-8Q1hFsFcrTfe31oVDNKmjHSI&usqp=CAU',
      name: 'Room Sofa',
      description: 'This is product 1 description',
      price: 29.99,
      colors: [Colors.red, Colors.blue],
    ),
    Product(
      image:
          'https://m.media-amazon.com/images/I/61hGsOxdrXL._AC_UF350,350_QL80_.jpg',
      name: 'TV',
      description: 'This is product 2 description',
      price: 39.99,
      colors: [Colors.green, Colors.yellow],
    ),
    Product(
      image:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQZ625tZiiIPoNP69_OVpi_q0TnMAaUMyul0w&s',
      name: 'lamp',
      description: 'This is product 1 description',
      price: 29.99,
      colors: [Colors.red, Colors.blue],
    ),
    Product(
      image:
          'https://m.media-amazon.com/images/I/91SGVKZfV7L._AC_UF350,350_QL80_.jpg',
      name: 'wood table',
      description: 'This is product 2 description',
      price: 39.99,
      colors: [Colors.green, Colors.yellow],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Find the home furniture ')),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.8,
        ),
        itemCount: products.length,
        itemBuilder: (context, index) {
          return ProductItem(product: products[index]);
        },
      ),
    );
  }
}

class ProductItem extends StatefulWidget {
  final Product product;

  ProductItem({required this.product});

  @override
  _ProductItemState createState() => _ProductItemState();
}

class _ProductItemState extends State<ProductItem> {
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ProductDetailsScreen(product: widget.product),
          ),
        );
      },
      child: Card(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(widget.product.image, fit: BoxFit.fitHeight),
            Padding(
              padding: const EdgeInsets.all(3),
              child: Text(widget.product.name, style: TextStyle(fontSize: 16)),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 3),
              child: Text('\$${widget.product.price.toStringAsFixed(2)}',
                  style: TextStyle(fontSize: 14)),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 3),
              //l7d ma3rf a3ml el provider
              child: IconButton(
                icon: Icon(isFavorite ? Icons.favorite : Icons.favorite_border,
                    color: isFavorite ? Colors.blue : Colors.grey),
                onPressed: () {
                  setState(() {
                    isFavorite = !isFavorite;
                  });
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
