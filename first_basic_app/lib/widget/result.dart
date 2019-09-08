import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final Function resetQuiz;

  String get resultText {
    String resultText;
    if (resultScore <= 8) {
      resultText = 'You are so awsome and innocent!';
    } else if (resultScore <= 12) {
      resultText = 'Pretty likeable!';
    } else if (resultScore <= 16) {
      resultText = 'You are ..... strange??!';
    } else {
      resultText = 'You are so bad';
    }
    return resultText;
  }

  final int resultScore;

  Result({this.resultScore, this.resetQuiz});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          Text(
            resultText,
            style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          FlatButton(child: Text('Restart Quiz!'),
          textColor: Colors.blue,
          onPressed: () => resetQuiz(),)
        ],
      ),
    );
  }
}
