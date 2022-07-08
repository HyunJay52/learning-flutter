import 'package:flutter/material.dart';

class SecondRoute extends StatelessWidget {
  const SecondRoute({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('This is Second Screen'),
        ),
        body: Center(
          child: TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('go back 🔙'),
          ),
        ));
  }
}
