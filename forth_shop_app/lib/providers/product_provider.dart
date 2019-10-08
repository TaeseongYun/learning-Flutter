import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:forth_shop_app/model/http_exception.dart';
import 'package:forth_shop_app/routers/route.dart';
import 'package:http/http.dart' as http;
import './product.dart';

class Products with ChangeNotifier {
  List<Product> _items = [];

  List<Product> get items => _items;

  List<Product> get favoriteItems =>
      _items.where((prodItem) => prodItem.isFavorite).toList();

  final String authToken;
  final String userId;

  Products(this._items, this.authToken, this.userId);

  Future<void> fetchAndSetProducts([bool filterByUser = false]) async {
    final filterString =
        filterByUser ? 'orderBy="createId"&equalTo="$userId"' : '';
    final response = await http
        .get(Router.baseUrl + 'products.json?auth=$authToken&$filterByUser');

    try {
      final extractedData = json.decode(response.body) as Map<String, dynamic>;

      if (extractedData == null) {
        return;
      }

      final favoriteReponse = await http
          .get(Router.baseUrl + 'userFavorite/$userId.json?auth=$authToken');

      final favoriteData = jsonDecode(favoriteReponse.body);

      final List<Product> loadedProdcuts = [];

      extractedData.forEach((prodId, prodData) {
        loadedProdcuts.add(Product(
          id: prodId,
          title: prodData['title'],
          description: prodData['description'],
          price: prodData['price'],
          imageUrl: prodData['imageUrl'],
          isFavorite:
              favoriteData == null ? false : favoriteData[prodId] ?? false,
        ));
      });
      _items = loadedProdcuts;
      notifyListeners();
    } catch (error) {
      print(error);
      throw error;
    }
  }

  Future<void> addProduct(Product product) async {
    try {
      final response = await http.post(
        Router.baseUrl + 'products.json?auth=$authToken',
        body: json.encode(
          {
            'title': product.title,
            'description': product.description,
            'price': product.price,
            'imageUrl': product.imageUrl,
            'createId': userId,
          },
        ),
      );
      final newProduct = Product(
        title: product.title,
        description: product.description,
        id: json.decode(response.body)['name'],
        imageUrl: product.imageUrl,
        price: product.price,
      );
      _items.add(newProduct);
      notifyListeners();
    } catch (e) {
      print(e);
      throw e;
    }

    // print(json.decode(res.body));
  }

  Product findById(String id) {
    return _items.firstWhere((prod) => prod.id == id);
  }

  Future<void> updateProduct(String id, Product newProduct) async {
    final prodIndex = _items.indexWhere((prod) => prod.id == id);
    if (prodIndex >= 0) {
      await http.patch(Router.baseUrl + 'products/$id.json?auth=$authToken',
          body: json.encode({
            'title': newProduct.title,
            'description': newProduct.description,
            'price': newProduct.price,
            'imageUrl': newProduct.imageUrl
          }));
      _items[prodIndex] = newProduct;
      notifyListeners();
    } else {
      print('...');
    }
  }

  Future<void> deleteProduct(String productID) async {
    final existingProductIndex =
        _items.indexWhere((prod) => prod.id == productID);
    var existingProduct = _items[existingProductIndex];
    _items.removeAt(existingProductIndex);
    notifyListeners();
    final response = await http
        .delete(Router.baseUrl + '/products/$productID.json?auth=$authToken');
    if (response.statusCode >= 400) {
      _items.insert(existingProductIndex, existingProduct);
      notifyListeners();
      throw HttpException(errorString: 'Could not delete product.');
    }

    existingProduct = null;
  }
}
