import 'dart:async';

import 'package:flutter/material.dart';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:network_connection_test/widgets/no_network_button.dart';

class NetworkAlram extends StatefulWidget {
  const NetworkAlram({Key? key}) : super(key: key);

  @override
  State<NetworkAlram> createState() => _NetworkAlramState();
}

class _NetworkAlramState extends State<NetworkAlram> {
  String _status = '';
  bool _flag = false;

  late StreamSubscription _subscription; // 네트워크 변화 확인

  Future<void> CheckConnectivity() async {
    var result = await Connectivity().checkConnectivity();

    if (result == ConnectivityResult.mobile) {
      setState(() {
        _status = "Mobile Network";
      });
    } else if (result == ConnectivityResult.wifi) {
      setState(() {
        _status = 'Wifi Network';
      });
    } else if (result == ConnectivityResult.none) {
      setState(() {
        _status = 'No Network';
        _flag = true;
      });
    }
  }

  @override
  void initState() {
    CheckConnectivity(); // 1회성 검사

    _subscription = Connectivity().onConnectivityChanged.listen((result) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('connectivity changed to ${result.name}'),
        ),
      );

      setState(
        () {
          _status = result.name;
          if (result.name == 'none') _flag = true;
        },
      );
    });
    super.initState();
  }

  @override
  void dispose() {
    _subscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: Text(_status),
        ),
        if (_flag) const NoNetworkButton(),
      ],
    );
  }
}
