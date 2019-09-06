import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  final Function sendedHandler;
  final String answerText;

  Answer({this.sendedHandler, this.answerText});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: RaisedButton(
        color: Colors.blue[600],
        textColor: Colors.white,
        child: Text(answerText),
        onPressed: sendedHandler,
      ),
    );
  }
}
