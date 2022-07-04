import 'package:flutter/material.dart';
import './question.dart';
import './answer.dart';
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
  // base class
  //const MyFlutterApp({super.key});
  var _questionIndex = 0;

  // method
  void answerQuestion() {
    // re-render changed properties
    setState(() {
      _questionIndex = _questionIndex + 1;
    });

    print(_questionIndex);
  }

  @override // draw Flutter widgets
  Widget build(BuildContext context) {
    var questions = [
      'what\'s yout fav colour?',
      'what\'s your fav animal?',
    ];

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('My First Flutter App'),
        ),
        body: Column(
          // list
          children: [
            Question(
              questions[_questionIndex],
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
            ),
            _buildElevatedButton('Answer 3', () => print('answer 3 chosen !')),
            // ElevatedButton(
            //   child: Text('Answer 3'),
            //   onPressed: () => print('answer 3 chosen !'),
            // ),
          ],
        ),
      ),
    );
  }

  Widget _buildElevatedButton(String text, VoidCallback? onPressed) {
    return ElevatedButton(
      child: Text(text),
      onPressed: onPressed,
    );
  }
}
