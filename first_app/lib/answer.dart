import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  // create constructor
  final VoidCallback selectHandler;
  final String answerText;

  Answer(this.selectHandler, this.answerText);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: Colors.lightGreen, // button background
          onPrimary: Colors.white, // button text
        ),
        onPressed: selectHandler,
        child: Text(answerText),
      ),
    );
  }
}
