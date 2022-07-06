import 'package:flutter/material.dart';

class EngOutput extends StatelessWidget {
  final String newWord;
  final int wordCnt;
  final int colorIdx;

  final List<MaterialColor> colorList = Colors.primaries;

  // EngOutput(this.newWord, this.wordCnt);
  EngOutput(this.newWord, this.wordCnt, this.colorIdx);

  @override
  Widget build(BuildContext context) {
    // String output = newWord + '$wordCnt';
    final output = 'count : $wordCnt';
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          newWord,
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            color: colorList[colorIdx],
          ),
        ),
        Text(
          output,
          style: const TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.bold,
            color: Colors.grey,
          ),
        ),
      ],
    );
  }
}
