import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  var questions = [
    'What\'s your favorite animals?',
    'What\'s your favorite foods?'
  ];
  void answerQuestions() {
    print('Answer choosen');
  }
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('It`s my first app'),
        ),
        body: Column(
          children: <Widget>[
            Text(
              questions.elementAt(1),
            ),
            RaisedButton(
              child: Text('Anwser 1'),
              onPressed: null,
            ),
            RaisedButton(
              child: Text('Anwser 2'),
              onPressed: () => print('Answer2 Choosen'),
            ),
            RaisedButton(
              child: Text('Anwser 3'),
              onPressed: answerQuestions,
            )
          ],
        ),
      ),
    );
  }
}
