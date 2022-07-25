import 'package:flutter/material.dart';
import 'package:gaga_http_test/pages/request_id_detail_page.dart';
import 'package:gaga_http_test/providers/user_provider.dart';
import 'package:provider/provider.dart';

//providers
import 'package:gaga_http_test/providers/estimate_provider.dart';

//pages
import 'pages/login_page.dart';

void main(List<String> args) {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Gaga http test app',
      home: MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (context) => EstimateProvider(),
          ),
          ChangeNotifierProvider(
            create: (context) => UserProvider(),
          ),
        ],
        child: const LoginPage(),
        //ReqeustIdDetailPage(),
      ),
      // initialRoute: LoginPage.routeName,
      routes: {
        LoginPage.routeName: (context) => const LoginPage(),
        ReqeustIdDetailPage.routeName: (context) => const ReqeustIdDetailPage(),
      },
    );
  }
}
