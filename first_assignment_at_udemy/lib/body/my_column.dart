import 'package:first_assignment_at_udemy/components/my_button.dart';
import 'package:flutter/material.dart';
import '../components/my_text.dart';

class MyColumn extends StatelessWidget {
  final Function onClickFunction;
  final String myChangedText;

  final Function onClickResetFunction;
  final int outOfIndex;
  MyColumn(
      {this.onClickFunction,
      this.myChangedText,
      this.outOfIndex,
      this.onClickResetFunction});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        MyButton(
          myCustomFunction: onClickFunction,
        ),
        MyText(myTextParameter: myChangedText),
        outOfIndex >= 1
            ? MyButton(
                myCustomFunction: onClickResetFunction,
              )
            : MyText(
                myTextParameter: 'Keep Going :)',
              )
      ],
    );
  }
}
