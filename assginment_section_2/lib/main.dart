import 'package:flutter/material.dart';

import 'text_control.dart';
import 'eng_control.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Section 2. Assginment!'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Container(
              height: 60,
              color: Colors.green,
              child: const Text(
                ' Test ',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 50,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const Divider(
              color: Colors.blueAccent,
            ),
            Container(
              height: 100,
              child: TextControl(),
            ),
            const Divider(
              color: Colors.blueAccent,
            ),
            Container(
              height: 150,
              child: EngControl(),
            )
          ],
        ),
      ),
    );
  }
}
