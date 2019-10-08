import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:forth_shop_app/routers/route.dart';
import 'package:http/http.dart' as http;
import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class Product with ChangeNotifier {
  final String id;
  final String title;
  final String description;
  final double price;
  final String imageUrl;
  bool isFavorite;

  Product({
    @required this.description,
    @required this.id,
    @required this.imageUrl,
    @required this.price,
    @required this.title,
    this.isFavorite = false,
  });

  void _setFavValue(bool newValue) {
    isFavorite = newValue;
    // notifyListeners();
  }

  Future<void> doIsFavorite(String token, String userId) async {
    final oldState = isFavorite;
    isFavorite = !isFavorite;
    notifyListeners();
    final url = Router.baseUrl + 'userFavorite/$userId/$id.json?auth=$token';
    try {
      final response = await http.put(
        url,
        body: json.encode(
          isFavorite,
        ),
      );

      if (response.statusCode >= 400) {
        _setFavValue(oldState);
      }
    } catch (error) {
      print(error);
      _setFavValue(oldState);
    }
  }
}
