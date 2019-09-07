import 'package:first_basic_app/custom/quiz.dart';
import 'package:first_basic_app/custom/result.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var _questionIndex = 0;

  var _totalScore = 0;

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  final _questions = const [
    // map's all of them each others
    {
      'questionTexts': 'What\'s your favorite color?',
      'answer': [
        {'text': 'Green', 'score': 10},
        {'text': 'Yellow', 'score': 4},
        {'text': 'Red', 'score': 2},
        {'text': 'Blue', 'score': 1}
      ]
    },
    {
      'questionTexts': 'What\'s your favorite animal?',
      'answer': [
        {'text': 'Rabbit', 'score': 10},
        {'text': 'Snake', 'score': 4},
        {'text': 'Lion', 'score': 2},
        {'text': 'Elephant', 'score': 1}
      ]
    },
    {
      'questionTexts': 'Who\'s your favorite instructor?',
      'answer': [
        {'text': 'Max', 'score': 3},
        {'text': 'Max', 'score': 3},
        {'text': 'Max', 'score': 3}
      ]
    }
  ];

  void answerQuestions(int score) {
    setState(() {
      _questionIndex += 1;
      _totalScore += score;
    });
    print(_questionIndex);
    if (_questionIndex < _questions.length) {
      print('We just need more questions!!');
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('It`s my first app'),
        ),
        body: _questionIndex < _questions.length
            ? Quiz(
                answerQuestions: answerQuestions,
                questions: _questions,
                questionIndex: _questionIndex,
              )
            : Result(
                resultScore: _totalScore,
                resetQuiz: _resetQuiz
              ),
      ),
    );
  }
}
