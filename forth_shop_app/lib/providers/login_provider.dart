import 'dart:convert';

import 'package:flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import '../routers/route.dart';

class LoginProvider extends ChangeNotifier {
  String _token;
  DateTime _expriyDate;
  String _userId;

  bool _isJoin = false;
  bool get isJoin => _isJoin;

  void toggle() {
    _isJoin = !_isJoin;
    notifyListeners();
  }

  Future<void> signUp(
      String email, String password, BuildContext context) async {
    try {
      final response = await http.post(
        Router.signUpUrl,
        body: json.encode(
          {
            'email': email,
            'password': password,
            'returnSecureToken': true,
          },
        ),
      );
      if (response.statusCode >= 400) {
        Flushbar(
          duration: Duration(seconds: 2),
          icon: Icon(
            Icons.info,
            color: Theme.of(context).primaryTextTheme.title.color,
          ),
          title: '존재하는 아이디 입니다.',
          message: '다른 아이디를 이용해주세요',
          leftBarIndicatorColor: Theme.of(context).errorColor,
        ).show(context);
        print('object');
      }
      print(jsonDecode(response.body));
    } catch (error) {
      print(error.toString());
    }
  }
}
