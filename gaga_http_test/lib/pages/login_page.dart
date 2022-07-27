import 'package:flutter/material.dart';
import 'package:gaga_http_test/pages/request_id_detail_page.dart';
import 'package:gaga_http_test/providers/user_provider.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  static const routeName = '/login';

  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    final provider = context.watch<UserProvider>();

    // submit event
    var _nameController = TextEditingController();
    var _pwdController = TextEditingController();

    void _loginDataSubmited() async {
      final userName = _nameController.text;
      final userPassword = _pwdController.text;

      if (userName.isEmpty) {
        //
        debugPrint('아이디 공란');
      } else if (userPassword.isEmpty) {
        //
        debugPrint('비밀번호 공란');
      } else {
        await provider.userAuthenticate(userName, userPassword);

        if (provider.loginStatus) {
          debugPrint('check!');
          Navigator.pushNamed(context, ReqeustIdDetailPage.routeName);
        }
        // else {
        //   Navigator.of(context).pop();
        // }
      }
    }

    return Scaffold(
      appBar: AppBar(title: const Text('로그인')),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(50, 20, 50, 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              decoration: const InputDecoration(hintText: '아이디를 입력해주세요.'),
              controller: _nameController,
              validator: (idField) {
                if (idField == null || idField.isEmpty) {
                  return '아이디를 입력하지 않으셨습니다.';
                }
                return null;
              },
            ),
            TextFormField(
              obscureText: true,
              autocorrect: false,
              enableSuggestions: false,
              controller: _pwdController,
              decoration: const InputDecoration(hintText: '비밀번호를 입력해주세요.'),
              validator: (pwdField) {
                if (pwdField == null || pwdField.isEmpty) {
                  return '비밀번호를 입력하지 않으셨습니다.';
                }
                return null;
              },
            ),
            SizedBox(
              width: 300,
              height: 50,
              child: Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: ElevatedButton(
                  onPressed: () {
                    _loginDataSubmited(); // _loginDataSubmited
                  },
                  child: const Text(
                    '로그인',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
