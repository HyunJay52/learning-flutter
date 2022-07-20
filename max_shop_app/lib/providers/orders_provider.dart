import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'cart_provider.dart';

class OrderModel {
  final String id;
  final double amount;
  final List<CartItemModel> products;
  final DateTime dateTime;

  OrderModel({
    required this.id,
    required this.amount,
    required this.products,
    required this.dateTime,
  });
}

class OrdersProvider with ChangeNotifier {
  List<OrderModel> _orders = [];

  List<OrderModel> get orders {
    return [..._orders];
  }

  Future<void> addOrder(List<CartItemModel> cartProducts, double total) async {
    final url = Uri.https(
        'max-shop-app-6454b-default-rtdb.asia-southeast1.firebasedatabase.app',
        '/orders.json');

    final timestamp = DateTime.now();

    final response = await http.post(
      url,
      body: json.encode(
        {
          'amount': total,
          'products': cartProducts
              .map((cp) => {
                    'id': cp.id,
                    'title': cp.title,
                    'quantity': cp.quantity,
                    'price': cp.price,
                  })
              .toList(),
          'dateTime': timestamp.toIso8601String(),
        },
      ),
    );

    _orders.insert(
      0,
      OrderModel(
        id: json.decode(response.body)['name'],
        amount: total,
        products: cartProducts,
        dateTime: timestamp,
      ),
    );

    notifyListeners();
  }
}
