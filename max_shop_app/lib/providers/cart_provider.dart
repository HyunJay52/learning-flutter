import 'package:flutter/material.dart';

class CartItemModel {
  final String id;
  final String title;
  final int quantity;
  final double price;

  CartItemModel({
    required this.id,
    required this.title,
    required this.quantity,
    required this.price,
  });
}

class CartProvider with ChangeNotifier {
  Map<String, CartItemModel> _items = {};

  Map<String, CartItemModel> get items {
    return {..._items};
  }

  // counting items
  int get itemCount {
    return _items.length;
  }

  double get totalAmount {
    var total = 0.0;
    _items.forEach((key, cartItem) {
      total += cartItem.price * cartItem.quantity;
    });
    return total;
  }

  void addCart(
    String prodId,
    double price,
    String title,
  ) {
    if (_items.containsKey(prodId)) {
      // change quantity
      _items.update(
        prodId,
        (existingCardItem) => CartItemModel(
          id: existingCardItem.id,
          title: existingCardItem.title,
          quantity: existingCardItem.quantity + 1,
          price: existingCardItem.price,
        ),
      );
    } else {
      _items.putIfAbsent(
        prodId,
        () => CartItemModel(
          id: DateTime.now().toString(),
          title: title,
          price: price,
          quantity: 1, // add new item
        ),
      );
    }
    notifyListeners();
  }
}
