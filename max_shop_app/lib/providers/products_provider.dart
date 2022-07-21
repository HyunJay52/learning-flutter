import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:max_shop_app/models/http_exception.dart';
import 'package:max_shop_app/widgets/order_item.dart';
import 'product.dart';
import 'package:http/http.dart' as http;

class ProductsProvider with ChangeNotifier {
  List<ProductModel> _items = [
    // ProductModel(
    //   id: 'p1',
    //   title: 'Red Shirt',
    //   description: 'A red shirt - it is pretty red!',
    //   price: 29.99,
    //   imageUrl:
    //       'https://cdn.pixabay.com/photo/2016/10/02/22/17/red-t-shirt-1710578_1280.jpg',
    // ),
    // ProductModel(
    //   id: 'p2',
    //   title: 'Trousers',
    //   description: 'A nice pair of trousers.',
    //   price: 59.99,
    //   imageUrl:
    //       'https://upload.wikimedia.org/wikipedia/commons/thumb/e/e8/Trousers%2C_dress_%28AM_1960.022-8%29.jpg/512px-Trousers%2C_dress_%28AM_1960.022-8%29.jpg',
    // ),
    // ProductModel(
    //   id: 'p3',
    //   title: 'Yellow Scarf',
    //   description: 'Warm and cozy - exactly what you need for the winter.',
    //   price: 19.99,
    //   imageUrl:
    //       'https://live.staticflickr.com/4043/4438260868_cc79b3369d_z.jpg',
    // ),
    // ProductModel(
    //   id: 'p4',
    //   title: 'A Pan',
    //   description: 'Prepare any meal you want.',
    //   price: 49.99,
    //   imageUrl:
    //       'https://upload.wikimedia.org/wikipedia/commons/thumb/1/14/Cast-Iron-Pan.jpg/1024px-Cast-Iron-Pan.jpg',
    // ),
  ]; // able to add items by using notifyListener

  // var _showFavoriteOnly = false;

  //fetch items .... getter!
  List<ProductModel> get items {
    // if (_showFavoriteOnly) {
    //   return _items.where((prodItem) => prodItem.isFavorite).toList();
    // }
    return [..._items];
  }

  List<ProductModel> get favoriteItems {
    return _items.where((prodItem) => prodItem.isFavorite).toList();
  }

  // divide logic from widgets
  ProductModel findById(String id) {
    return _items.firstWhere((prod) => prod.id == id);
  }

  // list up in fav state
  // void showFavoritesOnly() {
  //   _showFavoriteOnly = true;
  //   notifyListeners();
  // }

  // void showAll() {
  //   _showFavoriteOnly = false;
  //   notifyListeners();
  // }

  // get, fetch data
  Future<void> fetchAndSetProducts() async {
    // final url = Uri.parse('<your-url>');
    final url = Uri.https(
        'max-shop-app-6454b-default-rtdb.asia-southeast1.firebasedatabase.app',
        '/products.json');
    try {
      final response = await http.get(url);
      final extractedData = json.decode(response.body) as Map<String, dynamic>;

      final List<ProductModel> loadedProducts = [];

      extractedData.forEach((prodId, prodData) {
        loadedProducts.add(
          ProductModel(
            id: prodId,
            title: prodData['title'],
            description: prodData['description'],
            price: prodData['price'],
            imageUrl: prodData['imageUrl'],
            isFavorite: prodData['isFavorite'],
          ),
        );
      });
      _items = loadedProducts;
      notifyListeners();
    } catch (error) {
      rethrow;
    }
  }

  // Future -> return http 👉 async - await -> no needn't 'return'
  Future<void> addProduct(ProductModel product) async {
    // sending data to http server - http server first (takes some time)
    final url = Uri.https(
        'max-shop-app-6454b-default-rtdb.asia-southeast1.firebasedatabase.app',
        '/products.json');

    // dart immediately excutes this code (post), not waiting response
    //    -> this kind of code is also called 'asyn'
    // if it is not excuted immediately, app gets frozen.
    try {
      final response = await http.post(
        url,
        body: json.encode({
          'title': product.title,
          'description': product.description,
          'imageUrl': product.imageUrl,
          'price': product.price,
          'isFavorite': product.isFavorite,
        }),
      );
      // after 'post'
      final newProduct = ProductModel(
        id: json.decode(response.body)['name'],
        title: product.title,
        description: product.description,
        price: product.price,
        imageUrl: product.imageUrl,
      );
      //_items.add(newProduct);
      _items.insert(0, newProduct); // at the start of the list
      notifyListeners();
      // other classes will listen the changes in this class
      // and re-build the widgets
    } catch (error) {
      debugPrint('products post error');
      rethrow;
    }
  }

  Future<void> updateProduct(String id, ProductModel product) async {
    final prodIdx = _items.indexWhere((prod) => prod.id == id);

    if (prodIdx >= 0) {
      final url = Uri.https(
          'max-shop-app-6454b-default-rtdb.asia-southeast1.firebasedatabase.app',
          '/products/$id.json');
      await http.patch(
        url,
        body: json.encode(
          {
            'title': product.title,
            'description': product.description,
            'price': product.price,
            'imageUrl': product.imageUrl,
          },
        ),
      );
      _items[prodIdx] = product;
      notifyListeners();
    } else {
      debugPrint('failed to update');
    }
  }

  Future<void> deleteProduct(String id) async {
    // status code
    // 200 201
    // 300
    // 400 405
    // 500
    final url = Uri.https(
        'max-shop-app-6454b-default-rtdb.asia-southeast1.firebasedatabase.app',
        '/products/$id.json');

    final existingProductIndex = _items.indexWhere((prod) => prod.id == id);
    ProductModel? exisitingProduct = _items[existingProductIndex];

    final response = await http.delete(url);

    _items.removeAt(existingProductIndex);
    //_items.removeWhere((prod) => prod.id == id);

    notifyListeners();
    if (response.statusCode >= HttpStatus.badRequest) {
      _items.insert(existingProductIndex, exisitingProduct);
      notifyListeners();
      throw HttpException('Could not delete the product...');
    }
    exisitingProduct = null;
  }
}
