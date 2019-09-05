import 'package:flutter/material.dart';
import 'components/question.dart';
import 'components/answer.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var _questionIndex = 0;

  var questions = [

    // map's all of them each others
    {
      'questionText': 'What\'s your favorite color?',
      'answer': ['Green', 'Yellow', 'Red', 'Blue']
    },
    {
      'questionText': 'What\'s your favorite animal?',
      'answer': ['Rabbit', 'Snake', 'Lion', 'Elephant']
    },
    {
      'questionText': 'Who\'s your favorite instructor?',
      'answer': ['Max', 'Max', 'Max', 'Max']
    }
  ];

  void answerQuestions() {
    setState(() => _questionIndex += 1);
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
            Answer(sendedHandler: answerQuestions),
            Answer(sendedHandler: answerQuestions),
            Answer(sendedHandler: answerQuestions)
          ],
        ),
      ),
    );
  }
}
