import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:forth_shop_app/routers/route.dart';
import 'package:http/http.dart' as http;
import 'package:pull_to_refresh/pull_to_refresh.dart';
import './product.dart';

class Products with ChangeNotifier {
  List<Product> _items = [];

  List<Product> get items => _items;

  List<Product> get favoriteItems =>
      _items.where((prodItem) => prodItem.isFavorite).toList();

  Future<void> fetchAndSetProducts() async {
    try {
      final response = await http.get(Router.productUrl);

      final extractedData = json.decode(response.body) as Map<String, dynamic>;
      final List<Product> loadedProdcuts = [];
      extractedData.forEach(
        (prodId, prodData) => loadedProdcuts.add(
          Product(
            id: prodId,
            title: prodData['title'],
            description: prodData['description'],
            price: prodData['price'],
            isFavorite: prodData['isFravorite'],
            imageUrl: prodData['imageUrl'],
          ),
        ),
      );
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
        Router.productUrl,
        body: json.encode(
          {
            'title': product.title,
            'description': product.description,
            'price': product.price,
            'isFravorite': product.isFavorite,
            'imageUrl': product.imageUrl
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

  void removedProduct(String id) {
    _items.removeWhere((prod) => prod.id == id);
    notifyListeners();
  }

  void updateProduct(String id, Product newProduct) {
    final prodIndex = _items.indexWhere((prod) => prod.id == id);
    _items[prodIndex] = newProduct;
    notifyListeners();
  }

  void onRefresh(RefreshController refreshController) async {
    await Future.delayed(Duration(milliseconds: 1000));
    refreshController.refreshCompleted();
  }

  void onLoading(RefreshController refreshController) async {
    await Future.delayed(Duration(milliseconds: 1000));
    refreshController.refreshCompleted();
  }
}
