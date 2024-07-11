import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_mira/presentation/product.dart';
import 'package:task_mira/presentation/product_details.dart';

import 'GridItemProvider.dart';

class GridItemWidget extends StatelessWidget {
  final int? index;
  final Product? product;


  GridItemWidget( this.index, this.product);

  @override
  Widget build(BuildContext context) {
    final gridItem = Provider.of<GridItemProvider>(context).items[index!];

    return GridTile(
        child: GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ProductDetailsScreen(product: product!),
                ),
              );
            },
            child: Card(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.network(
                  gridItem.image,
                  height: 130,
                  fit: BoxFit.fitWidth,
                ),
                Padding(
                  padding: const EdgeInsets.all(3),
                  child: Text(gridItem.name, style: TextStyle(fontSize: 16)),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 3),
                  child: Text('\$${gridItem.price.toStringAsFixed(2)}',
                      style: TextStyle(fontSize: 14)),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 3),
                  //l7d ma3rf a3ml el provider
                  child: GestureDetector(
                    onTap: (){
                      Provider.of<GridItemProvider>(context, listen: false).toggleFavorite(index!);
                    },
                    child: Icon(gridItem.isFavorite
                        ? CupertinoIcons.heart_fill
                        : CupertinoIcons.heart,
                      color: gridItem.isFavorite ? Colors.red : null,),
                  )
                  // IconButton(
                  //   icon: Icon(
                  //     gridItem.isFavorite
                  //         ? Icons.favorite
                  //         : Icons.favorite_border,
                  //     color: gridItem.isFavorite ? Colors.red : null,
                  //   ),
                  //   onPressed: () {
                  //     Provider.of<GridItemProvider>(context, listen: false).toggleFavorite(index);
                  //
                  //   },
                  // ),
                ),
              ],
            ))));
    //   Column(
    //     children: [
    //       Image.network(gridItem.image),
    //       Text(gridItem.description),
    //       IconButton(
    //         icon: Icon(
    //           gridItem.isFavorite ? Icons.favorite : Icons.favorite_border,
    //           color: gridItem.isFavorite ? Colors.red : null,
    //         ),
    //         onPressed: () {
    //           Provider.of<GridItemProvider>(context, listen: false).toggleFavorite(index);
    //         },
    //       ),
    //     ],
    //   ),
    // );
  }
}
