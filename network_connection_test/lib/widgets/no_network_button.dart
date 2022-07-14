import 'package:flutter/material.dart';

class NoNetworkButton extends StatelessWidget {
  const NoNetworkButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        debugPrint('back to home!');

        Navigator.pop(context);
      },
      child: const Text('Check your Network!'),
    );
  }
}
