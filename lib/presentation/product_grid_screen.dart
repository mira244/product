import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_mira/presentation/product.dart';
import 'GridItemProvider.dart';
import 'GridItemWidget.dart';
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
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text('find home furniture '),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 200.0,
              // Set the height of the
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 10,
                itemBuilder: (context, index) {
                  return Container(
                    width: 150.0, // Set the width of each
                    margin: EdgeInsets.all(8.0),
                    color: Colors.blue,
                    child: Center(
                      child: Text(
                        'Item $index',
                        style: TextStyle(color: Colors.white, fontSize: 20.0),
                      ),
                    ),
                  );
                },
              ),
            ),
            Container(
              height: size.height * 2,
              child: Consumer<GridItemProvider>(
                builder: (context, gridItemProvider, child) {
                  return GridView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 0.8,
                    ),
                    itemCount: gridItemProvider.items.length,
                    itemBuilder: (context, index) {
                      return GridItemWidget(
                          index, gridItemProvider.items[index]);
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
  // @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     appBar: AppBar(title: Text('Find the home furniture ')),
  //     body: GridView.builder(
  //       gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
  //         crossAxisCount: 2,
  //         childAspectRatio: 0.8,
  //       ),
  //       itemCount: products.length,
  //       itemBuilder: (context, index) {
  //         return ProductItem(product: products[index]);
  //       },
  //     ),
  //   );
  // }


// class ProductItem extends StatefulWidget {
//   final Product product;
//
//   ProductItem({required this.product});
//
//   @override
//   _ProductItemState createState() => _ProductItemState();
// }
//
// class _ProductItemState extends State<ProductItem> {
//   bool isFavorite = false;
//
//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: () {
//         Navigator.push(
//           context,
//           MaterialPageRoute(
//             builder: (context) => ProductDetailsScreen(product: widget.product),
//           ),
//         );
//       },
//       child: Card(
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Image.network(widget.product.image, height: 130,fit: BoxFit.fitWidth,),
//             Padding(
//               padding: const EdgeInsets.all(3),
//               child: Text(widget.product.name, style: TextStyle(fontSize: 16)),
//             ),
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 3),
//               child: Text('\$${widget.product.price.toStringAsFixed(2)}',
//                   style: TextStyle(fontSize: 14)),
//             ),
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 3),
//               //l7d ma3rf a3ml el provider
//               child:   IconButton(
//                 icon: Icon(
//                   product.isFavorite ? Icons.favorite : Icons.favorite_border,
//                   color: product.isFavorite ? Colors.red : null,
//                 ),
//                 onPressed: () {
//                   Provider.of<GridItemProvider>(context, listen: false).toggleFavorite(index);
//                 },
//               ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
