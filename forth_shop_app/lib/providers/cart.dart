import 'package:flutter/foundation.dart';

class CartItem {
  final String id;
  final String title;
  final int quantity; //얼마나 많이 있는지
  final double price;

  CartItem({
    @required this.title,
    @required this.id,
    @required this.price,
    @required this.quantity,
  });
}

class Cart with ChangeNotifier {
  Map<String, CartItem> _items = {};

  Map<String, CartItem> get items => _items;

  int get itemCount {
    return  _items.length;
  }

double get totalAmout {
  var total = 0.0;
  _items.forEach((key, cartItem) => total += cartItem.price * cartItem.quantity);
  return total;
}
  void addItem(
    String productsId,
    double price,
    String title,
  ) {
    if (_items.containsKey(productsId)) {
      _items.update(
        productsId,
        (exisitingCartItem) => CartItem(
          quantity: exisitingCartItem.quantity + 1,
          id: exisitingCartItem.id,
          price: exisitingCartItem.price,
          title: exisitingCartItem.title,
        ),
      );
    } else {
      _items.putIfAbsent(
        productsId,
        () => CartItem(
          title: title,
          id: DateTime.now().toString(),
          price: price,
          quantity: 1,
        ),
      );
    }
    notifyListeners();
  }
}
