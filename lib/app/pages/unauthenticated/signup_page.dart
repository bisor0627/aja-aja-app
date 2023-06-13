import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SignUpPage extends ConsumerWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(title: Text('회원가입')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              decoration: InputDecoration(
                labelText: '휴대폰번호',
              ),
            ),
            TextField(
              obscureText: true,
              decoration: InputDecoration(
                labelText: '비밀번호',
              ),
            ),
            TextField(
              obscureText: true,
              decoration: InputDecoration(
                labelText: '비밀번호 확인',
              ),
            ),
            ElevatedButton(
              child: Text('회원가입'),
              onPressed: () {
                // context.go() 로직
              },
            ),
          ],
        ),
      ),
    );
  }
}
