import 'package:flutter/material.dart';

class ProductDetailPage extends StatelessWidget {
  // final String title;
  // final double price;

  // const ProductDetailPage(this.title, this.price, {Key? key}) : super(key: key);

  static const routeName = '/product-detail';

  @override
  Widget build(BuildContext context) {
    final productId = ModalRoute.of(context)?.settings.arguments as String;
    // ...

    return Scaffold(
      appBar: AppBar(title: Text('-')),
    );
  }
}
