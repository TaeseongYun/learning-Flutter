import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
final Function sendedHandler;

  Answer({this.sendedHandler});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: RaisedButton(
        color: Colors.blue[600],
        textColor: Colors.white,
        child: Text('Answer 1'),
        onPressed: sendedHandler,
      ),
    );
  }
}
