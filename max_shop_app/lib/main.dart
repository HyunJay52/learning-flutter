import 'package:flutter/material.dart';
import 'package:max_shop_app/pages/cart_page.dart';
import 'package:max_shop_app/providers/cart_provider.dart';
import 'package:provider/provider.dart';

import './pages/products_overview_page.dart';
import './pages/product_detail_page.dart';
import './providers/products_provider.dart';
import './pages/cart_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // provider : ChangeNotifierProvider > create provider instance,
    //             > product class is changed, notifyListener in productsprovodier class will listen the change
    //            and the widgets which are listening will rebuild
    //            not the whole materialapp,
    return MultiProvider(
      // ChangeNotifierProvider.value() only for one -> more than on providers
      providers: [
        ChangeNotifierProvider.value(
          value: ProductsProvider(),
        ),
        ChangeNotifierProvider.value(
          value: CartProvider(),
        ),
        // ChangeNotifierProvider.value(
        //   value: ProductsProvider(),
        //   create: (ctx) => ProductsProvider(),
        // ),
      ], // build > create
      child: MaterialApp(
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
          CartPage.routeName: (ctx) => CartPage(),
        },
      ),
    );
  }
}
