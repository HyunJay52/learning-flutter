import 'package:flutter/material.dart';
import 'package:network_connection_test/widgets/network_alram_widget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Connectiviy plus test',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Connectivity plus Test...'),
        ),
        body: const NetworkAlram(),
      ),
    );
  }
}
