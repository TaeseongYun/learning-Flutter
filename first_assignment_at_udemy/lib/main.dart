import 'package:first_assignment_at_udemy/body/my_column.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var _listIndex = 0;

  final stringList = const [
    'Hello It is my First assignment!!',
    'And I clicked button'
  ];

  void _myCustomFunction() {
    setState(() => _listIndex += 1);
  }

  void _myCustomResetFunction() {
    setState(() {
      _listIndex = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('My First Assignment'),
        ),
        body: MyColumn(
          onClickFunction: _myCustomFunction,
          myChangedText: stringList[_listIndex],
          outOfIndex: _listIndex,
          onClickResetFunction: _myCustomResetFunction,
        ),
      ),
    );
  }
}
