import 'package:flutter/material.dart';

class Question extends StatelessWidget {
  final String questionText;
  //constructor
  Question(this.questionText);

  @override
  Widget build(BuildContext context) {
    return Text(
      questionText,
      style: TextStyle(fontSize: 20),
      textAlign: TextAlign.center,
    );
  }
}
