import 'dart:math';

import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

import 'eng_output.dart';

class EngControl extends StatefulWidget {
  //Engcontrol({Key? key}) : super(key: key);

  @override
  State<EngControl> createState() => _EngControlState();
}

class _EngControlState extends State<EngControl> {
  int _wordCnt = 0;

  @override
  Widget build(BuildContext context) {
    final wordPairt = WordPair.random().asSnakeCase;
    String _newWord = wordPairt;

    final r = Random().nextInt(Colors.primaries.length);
    int _color_idx = r;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Center(
          child: EngOutput(_newWord, _wordCnt, _color_idx),
        ),
        Center(
          child: OutlinedButton(
            onPressed: () {
              setState(() {
                _newWord = wordPairt;
                _wordCnt++;
                _color_idx = r;
              });
            },
            child: const Text('Next 📚'),
          ),
        ),
      ],
    );
  }
}
