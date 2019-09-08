import 'package:flutter/material.dart';
import '../components/answer.dart';
import '../components/question.dart';

class Quiz extends StatelessWidget {
  final List<Map<String, Object>> questions;
  final Function answerQuestions;
  final int questionIndex;

  Quiz(
      {@required this.answerQuestions,
      @required this.questions,
      @required this.questionIndex});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Question(
          questionText: questions[questionIndex]['questionTexts'],
        ),
        ...(questions[questionIndex]['answer'] as List<Map<String, Object>>)
            .map((answer) {
              print(answer);
          return Answer(
              sendedHandler: () => answerQuestions(answer['score']),
              answerText: answer['text']);
        }).toList()
      ],
    );
  }
}
