import 'dart:async';
//import 'dart:developer' as developer;

import 'package:flutter/material.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:fluttertoast/fluttertoast.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Connectivity plus',
      theme: ThemeData(
        primarySwatch: Colors.lightGreen,
      ),
      home: const MyHomePage(title: 'Network connection test'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // ------------------- connectivity plugin
  StreamSubscription<ConnectivityResult>? _networkListener;
  late final String networkStatus;

  @override
  void initState() {
    networkStatus = 'no network';
    super.initState();

    _networkListener = Connectivity().onConnectivityChanged.listen(
      (ConnectivityResult connectResult) {
        switch (connectResult) {
          case ConnectivityResult.mobile:
            networkStatus = 'mobile';
            showToastMessage(networkStatus);
            break;
          case ConnectivityResult.bluetooth:
            networkStatus = 'bluetooth';
            showToastMessage(networkStatus);
            break;
          case ConnectivityResult.ethernet:
            networkStatus = 'ethernet';
            showToastMessage(networkStatus);
            break;
          case ConnectivityResult.wifi:
            networkStatus = 'wifi';
            showToastMessage(networkStatus);
            break;
          case ConnectivityResult.none:
            networkStatus = 'none';
            showToastMessage(networkStatus);
            break;
        }
      },
    );
  }

  @override
  void dispose() {
    super.dispose();

    if (_networkListener != null) {
      _networkListener!.cancel();
    }
  }

  // network alram
  void showToastMessage(networkMsg) {
    Fluttertoast.showToast(
      msg: networkMsg,
      gravity: ToastGravity.CENTER,
      timeInSecForIosWeb: 2,
      backgroundColor: const Color.fromARGB(255, 237, 191, 52),
      textColor: Colors.white,
      fontSize: 13.0,
    );
  }

  // widget builder
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () {
                showToastMessage(networkStatus);
              },
              child: const Text('click!'),
            ),
          ],
        ),
      ),
    );
  }
}
