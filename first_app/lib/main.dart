import 'package:flutter/material.dart';
import 'pages/quiz.dart';
import './result.dart';
/*
  widgets package
  Google : Material Design
  Apple : Cupertino Design
  MS : Metro Design
*/

void main() {
  // void main() => runApp(MyFlutterApp());
  // execute app(widget), app launches
  runApp(MyFlutterApp());
  // runApp is provided by Flutter
}

// widgets == component
// StatelessWidget, StatefulWidget - widgets class
class MyFlutterApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return MyFlutterAppState();
  }
}

class MyFlutterAppState extends State<MyFlutterApp> {
  //static
  final _questions = const [
    {
      'questionText': 'what\'s yout fav colour?',
      'answers': [
        {'text': 'white', 'score': 5},
        {'text': 'black', 'score': 10},
        {'text': 'green', 'score': 15},
        {'text': 'yellow', 'score': 20},
      ]
    },
    {
      'questionText': 'what\'s your fav animal?',
      'answers': [
        {'text': 'lion', 'score': 5},
        {'text': 'elephant', 'score': 10},
        {'text': 'rabbit', 'score': 20},
        {'text': 'dog', 'score': 15},
      ]
    },
    {
      'questionText': 'what\'s your fav food?',
      'answers': [
        {'text': 'pizza', 'score': 5},
        {'text': 'noodle', 'score': 20},
        {'text': 'veggie', 'score': 100},
        {'text': 'honey', 'score': 50},
      ]
    },
  ];
  // base class
  //const MyFlutterApp({super.key});
  var _questionIndex = 0;
  var _totalScore = 0;

  // method
  void _answerQuestion(int score) {
    _totalScore += score;

    // re-render changed properties
    setState(() {
      _questionIndex = _questionIndex + 1;
    });

    if (_questionIndex < _questions.length) {
      //_questionIndex = 0;
      debugPrint('we have more question!');
    } else {
      debugPrint('no more questions...');
    }
  }

  @override // draw Flutter widgets
  Widget build(BuildContext context) {
    // quesiotn = []; does not work if questions is a const

    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: const Text('My First Flutter App'),
          ),
          body: _questionIndex < _questions.length
              ? Quiz(
                  answerQuestion: _answerQuestion,
                  questionIndex: _questionIndex,
                  questions: _questions,
                )
              : Result()),
    );
  }
}
