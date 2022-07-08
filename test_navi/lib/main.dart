import 'package:flutter/material.dart';

// second navi
import './first_route.dart';
import './second_route.dart';

/*
  Named Route 화면전환
  앱의 다른 많은 부분들에서 동일한 화면으로 이동하고자 한다면, 중복된 코드가 여러개 생기게 된다.
  이를 해결하기 위해서 Named Route 이용
  1. 두 개의 화면 만들기
  2. Route 정의하기
  3. Navigator.pushNamed 를 사용해 두 번째 화면으로 전환
  4. Navigator.pop 을 이용해 첫 번째 화면으로 돌아오기
 */

void main() {
  runApp(const MaterialApp(
    title: 'Navigator Basic',
    home: MyApp(),
  ));
}

// first route
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // '/'로 named route와 함께 시작
      initialRoute: '/',
      routes: {
        '/': (context) => const FirstRoute(),
        '/second': (context) => const SecondRoute(),
      },
    );
  }
}
