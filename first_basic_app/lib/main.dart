import 'package:flutter/material.dart';
import 'components/question.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var _questionIndex = 0;

  var questions = [
    'What\'s your favorite animals?',
    'What\'s your favorite foods?'
  ];

  void answerQuestions() {
    setState(() => 
      _questionIndex += 1
    );
    print(_questionIndex);
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
            Question(
              questionText: questions[_questionIndex],
            ),
            RaisedButton(
              child: Text('Anwser 1'),
              onPressed: answerQuestions,
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
