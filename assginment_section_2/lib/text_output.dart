import 'package:flutter/material.dart';

class TextOutput extends StatelessWidget {
  //const TextOutput({Key? key}) : super(key: key);
  final String mainText;

  TextOutput(this.mainText);

  @override
  Widget build(BuildContext context) {
    return Text(
      mainText,
      textAlign: TextAlign.center,
      style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
    );
  }
}
