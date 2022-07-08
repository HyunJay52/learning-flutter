import 'package:flutter/material.dart';

class FirstRoute extends StatelessWidget {
  const FirstRoute({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('This is Frist Screen'),
      ),
      body: Center(
        child: TextButton(
          onPressed: () {
            // Named Route를 사용하여 두 번째 화면으로 전환
            Navigator.pushNamed(context, '/second');

            // Navigator.push() 를 이용한 페이지 이동 방법
            // context
            // Navigator.push( context, MaterialRageRoute(builder : (context) => SecondRoute() ),
          },
          child: const Text('go to second'),
        ),
      ),
    );
  }
}
