import 'package:flutter/material.dart';

import '../question.dart';
import '../answer.dart';

class Quiz extends StatelessWidget {
  final List<Map<String, Object>> questions;
  final int questionIndex;
  //final Function answerQuestion;
  final Function(int score) answerQuestion;
  // void Function(int score) answerQuestion;
  //final VoidCallback answerQuestion;

  Quiz({
    required this.questions,
    required this.answerQuestion,
    required this.questionIndex,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      // list
      children: [
        Question(
          questions[questionIndex]['questionText'] as String,
        ),
        ...(questions[questionIndex]['answers'] as List<Map<String, Object>>)
            .map((answer) {
          return Answer(() => answerQuestion(answer['score'] as int),
              answer['text'] as String); // iterable
        }).toList(), // generate to create new List of answer map
        // ... spread operator : Column is List, try inserting new List into List, in this case, use spread operator (...)
        // ... make List to be inserted as an individual element in List
        // https://www.geeksforgeeks.org/dart-spread-operator/
        /*  Answer(
              _answerQuestion,
            ),
            Answer(
              _answerQuestion,
            ),
            Answer(
              _answerQuestion,
            ),

             ElevatedButton(
              onPressed: answerQuestion,
              child: const Text('Answer 1'),
            ),
            ElevatedButton(
              child: const Text('Answer 2'),
              onPressed: () => {
                //
                debugPrint('Answer 2 chosend !')
              },
            ), */
        //_buildElevatedButton('Answer 3', () => print('answer 3 chosen !')),
        // ElevatedButton(
        //   child: Text('Answer 3'),
        //   onPressed: () => print('answer 3 chosen !'),
        // ),
      ],
    );
  }
/*
  Widget _buildElevatedButton(String text, VoidCallback? onPressed) {
    return ElevatedButton(
      child: Text(text),
      onPressed: onPressed,
    );
  } */
}
