import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Gaga http test app',
      home: TestHome(),
    );
  }
}

class TestHome extends StatelessWidget {
  const TestHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Estimate Request'),
      ),
      body: Column(
        children: [
          Container(
            width: 350,
            height: 80,
            padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
            child: Form(
              child: TextFormField(
                decoration:
                    const InputDecoration(labelText: 'estimate number/id'),
                textInputAction: TextInputAction.done,
                keyboardType: TextInputType.number,
                onFieldSubmitted: (value) {
                  debugPrint('submited text : $value');
                },
              ),
            ),
          ),
          const Divider(
            thickness: 2.5,
            color: Colors.black54,
          ),
          const ListTile(
            leading: Text('leading'),
            title: Text('value'),
            tileColor: Colors.amber,
          ),
        ],
      ),
    );
  }
}
