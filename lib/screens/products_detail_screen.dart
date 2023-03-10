// // ignore_for_file: use_key_in_widget_constructors

// import 'dart:js';

// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:shop_app/providers/product.dart';
// import 'package:shop_app/providers/products.dart';

// class ProductsDetailScreen extends StatelessWidget {
// //  final String title;
// //  final double price;

// //  ProductsDetailScreen(this.title,this.price)

//   static const routeName = '/product-detail';
//   // final productId = ModalRoute.of(ctx).settings.arguments as String;
//   // final produtId = ModalRoute.of(ctx)?.settings.arguments as String;
//   final productid =
//       ModalRoute.of(context as BuildContext)?.settings.arguments as String;
//   final loadedProduct = Provider.of<Products>(context as BuildContext ,listen: false).findById(productid
//   )

//       ;
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text(loadedProduct.title)),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/products.dart';

class ProductDetailScreen extends StatelessWidget {
  // final String title;
  // final double price;

  // ProductDetailScreen(this.title, this.price);
  static const routeName = '/product-detail';

  @override
  Widget build(BuildContext context) {
    final productId =
        ModalRoute.of(context)?.settings.arguments as String; // is the id!
    final loadedProduct = Provider.of<Products>(
      context,
      listen: false,
    ).findById(productId);
    return Scaffold(
      appBar: AppBar(
        title: Text(loadedProduct.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 300,
              width: double.infinity,
              child: Image.network(
                loadedProduct.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              '\$${loadedProduct.price}',
              style: TextStyle(color: Colors.grey, fontSize: 20),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10),
              width: double.infinity,
              child: Text(loadedProduct.description,textAlign: TextAlign.center,
              softWrap: true,),
            )
          ],
        ),
      ),
    );
  }
}
