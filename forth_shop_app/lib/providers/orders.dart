import 'dart:convert';

import 'package:flutter/material.dart';
import './cart.dart';
import 'package:http/http.dart' as http;
import '../routers/route.dart';

class OrderItem {
  final String id;
  final double amount;
  final List<CartItem> cartItems;
  final DateTime dateTime;

  OrderItem({
    @required this.id,
    @required this.amount,
    @required this.cartItems,
    @required this.dateTime,
  });
}

class Orders with ChangeNotifier {
  List<OrderItem> _orders = [];

  List<OrderItem> get orders => _orders;

  Future<void> fetchOrders() async {
    try {
      final response = await http.get(Router.baseUrl + 'orders.json');
      final getOrdersData = json.decode(response.body) as Map<String, dynamic>;

      final List<OrderItem> loadedOrdersItems = [];
      if (getOrdersData == null) {
        return;
      }
      getOrdersData.forEach((ordersId, orders) {
        loadedOrdersItems.add(
          OrderItem(
            amount: orders['amount'],
            id: ordersId,
            dateTime: DateTime.parse(orders['dateTime']),
            cartItems: (orders['products'] as List<dynamic>)
                .map(
                  (item) => CartItem(
                    id: item['id'],
                    price: item['price'],
                    quantity: item['quantity'],
                    title: item['title'],
                  ),
                )
                .toList(),
          ),
        );
      });

      _orders = loadedOrdersItems.reversed.toList();
      notifyListeners();
    } catch (error) {
      print(error);
    }
    // notifyListeners();
  }

  Future<void> addOrder(List<CartItem> cartProducts, double total) async {
    try {
      final timeStamp = DateTime.now();
      final response = await http.post(
        Router.baseUrl + 'orders.json',
        body: json.encode({
          'amount': total,
          'dateTime': timeStamp.toIso8601String(),
          'products': cartProducts
              .map((cp) => {
                    'id': cp.id,
                    'title': cp.title,
                    'price': cp.price,
                    'quantity': cp.quantity,
                  })
              .toList()
        }),
      );
      _orders.insert(
        0,
        OrderItem(
          id: json.decode(response.body)['name'],
          amount: total,
          dateTime: timeStamp,
          cartItems: cartProducts,
        ),
      );
      notifyListeners();
    } catch (error) {
      print(error);
    }
  }
}
