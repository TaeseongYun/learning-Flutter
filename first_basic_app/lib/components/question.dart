import 'package:flutter/material.dart';

class Question extends StatelessWidget {
  //final로 지정해준 이유? Flutter에서 그냥 var 지정해줄 경우
  // 값이 상수가 아닌 변수라 생각하여 StatefulWidget을 권한다.
  // 그러므로, 상수인 final 을 사용
  final String questionText;

  Question({this.questionText});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      width: double.infinity,
      child: Text(
        questionText,
        style: TextStyle(fontSize: 28.0),
        textAlign: TextAlign.center,
      ),
    );
  }
}
