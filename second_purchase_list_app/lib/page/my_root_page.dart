import 'package:flutter/material.dart';
import '../page/my_home_page.dart';

class MyRootPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Second App (Account book)',
      home: MyHomePage(),
    );
  }
}
