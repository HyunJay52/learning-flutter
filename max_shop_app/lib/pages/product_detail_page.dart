import 'package:flutter/material.dart';
import 'package:max_shop_app/providers/products_provider.dart';
import 'package:provider/provider.dart';

import '../providers/products_provider.dart';

class ProductDetailPage extends StatelessWidget {
  // final String title;
  // final double price;

  // const ProductDetailPage(this.title, this.price, {Key? key}) : super(key: key);

  static const routeName = '/product-detail';

  @override
  Widget build(BuildContext context) {
    final productId = ModalRoute.of(context)?.settings.arguments as String;

    // access to products data
    final loadedProduct = Provider.of<ProductsProvider>(
      context,
      listen:
          false, // prevent widgets from rebuilding automatically whenever having new data
    ).findById(productId);

    return Scaffold(
      appBar: AppBar(title: Text(loadedProduct.title)),
    );
  }
}
