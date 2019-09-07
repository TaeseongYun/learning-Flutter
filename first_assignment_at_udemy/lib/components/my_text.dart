import 'package:flutter/material.dart';

class MyText extends StatelessWidget {

  final String myTextParameter;

  MyText({this.myTextParameter});

  @override
  Widget build(BuildContext context) {
    return Text(
      myTextParameter
    );
  }
}