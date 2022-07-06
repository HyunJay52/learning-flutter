import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int resultScore;
  final VoidCallback resetHandler;

  Result(this.resultScore, this.resetHandler);

  String get resultPhrase {
    String resultText;

    if (resultScore <= 50) {
      resultText = 'you nailed it!';
    } else if (resultScore <= 20) {
      resultText = 'it is okay';
    } else if (resultScore <= 70) {
      resultText = 'you are awesome!!!';
    } else {
      resultText = 'try again!';
    }
    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      widthFactor: double.infinity,
      child: Column(
        children: <Widget>[
          Text(
            resultPhrase,
            style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          TextButton(
              onPressed: resetHandler,
              child: Text('Restart!'),
              style: TextButton.styleFrom(
                primary: Colors.green,
              ))
        ],
      ),
    );
  }
}
