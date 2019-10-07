import 'dart:convert';

import 'package:flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:forth_shop_app/routers/route.dart';
import 'package:http/http.dart' as http;

import '../http/api_key.dart';
import '../model/http_exception.dart';

class LoginProvider with ChangeNotifier {
  String _token;
  DateTime _expiryDate;
  String _userId;

  bool get isAuth {
    return token != null;
  }

  String get token {
    if (_expiryDate != null &&
        _expiryDate.isAfter(DateTime.now()) &&
        _token != null) {
      print('이프믄 둘어왔어용');

      print('이프문 안에서의 _token 값 => $_token');
      return _token;
    }
    return null;
  }

  Future<void> _authenticate(
    String email,
    String password,
    String urlSegment,
  ) async {
    final url = Router.firebaseAuthBaseUrl +
        '/accounts:$urlSegment?key=${APIKEY.API_KEY}';
    try {
      final response = await http.post(
        url,
        body: json.encode(
          {
            'email': email,
            'password': password,
            'returnSecureToken': true,
          },
        ),
      );

      print(jsonDecode(response.body));

      final responseData = json.decode(response.body);
      // print(responseData);
      if (responseData['error'] != null) {
        throw HttpException(errorString: responseData['error']['message']);
      }
      _token = responseData['idToken'];
      _userId = responseData['localId'];
      _expiryDate = DateTime.now().add(
        Duration(
          seconds: int.parse(
            responseData['expiresIn'],
          ),
        ),
      );

      // print('token value => $token');
      notifyListeners();
    } catch (error) {
      throw error;
    }
  }

  Future<void> signup(String email, String password) async {
    return _authenticate(email, password, 'signUp');
  }

  Future<void> login(String email, String password) async {
    return _authenticate(email, password, 'signInWithPassword');
  }
}
