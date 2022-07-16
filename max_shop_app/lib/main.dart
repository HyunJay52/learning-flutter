import 'package:flutter/material.dart';

import './pages/products_overview_page.dart';
import './pages/product_detail_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MyShop',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: Colors.purple,
        ).copyWith(
          secondary: Colors.deepOrange,
        ),
        fontFamily: 'QuickSand',
      ),
      home: ProductsOverviewPage(),
      routes: {
        ProductDetailPage.routeName: (ctx) => ProductDetailPage(),
      },
    );
  }
}
