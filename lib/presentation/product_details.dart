import 'package:flutter/material.dart';
import 'package:task_mira/presentation/product.dart';
import 'product_model.dart';

class ProductDetailsScreen extends StatelessWidget {
  final Product product;

  ProductDetailsScreen({required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(product.name),
        leading: const Icon(Icons.arrow_back),
      ),
      body: Center(
        // padding: const EdgeInsets.all(16.0),
        child: Column(
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              product.image,
              height: double.infinity,
              fit: BoxFit.fitHeight,
            ),
            SizedBox(height: 16),
            Text(product.name,
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            SizedBox(height: 8),
            SizedBox(height: 16),
            Text(product.description, style: TextStyle(fontSize: 16)),
            // SizedBox(height: 16),
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              Text('\$${product.price.toStringAsFixed(2)}',
                  style: TextStyle(fontSize: 20)),
              ElevatedButton(
                onPressed: () {},
                child: Text('Add to cart'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: (Colors.blue),
                ),
              ),
            ])
          ],
        ),
      ),
    );
  }
}
