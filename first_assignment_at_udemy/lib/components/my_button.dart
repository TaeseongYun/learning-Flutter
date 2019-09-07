import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final Function myCustomFunction;

  MyButton({this.myCustomFunction});
  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      child: Text('Clicked Me!'),
      onPressed: myCustomFunction,
    );
  }
}
