import 'package:flutter/material.dart';

import './text_output.dart';

class TextControl extends StatefulWidget {
  //TextControl({Key? key}) : super(key: key);

  @override
  State<TextControl> createState() => _TextControlState();
}

class _TextControlState extends State<TextControl> {
  String _mainText = 'This is the first one!';

  var _textPointer = 0;

  final _texts = [
    'study Flutter 📚',
    'Flutter is cool 😎',
    'Flutter is epic!',
    'this is the end of List',
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        TextOutput(_mainText),
        ElevatedButton(
          onPressed: () {
            setState(() {
              if (_textPointer >= _texts.length) {
                _textPointer = 0;
              }
              _mainText = _texts[_textPointer];
              _textPointer += 1;
            });

            debugPrint('setState works!');
          },
          child: const Text('Next'),
        ),
      ],
    );
  }
}
