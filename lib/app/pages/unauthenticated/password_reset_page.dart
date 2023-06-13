import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ResetPasswordPage extends ConsumerWidget {
  const ResetPasswordPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(title: Text('비밀번호 재설정')),
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
              decoration: InputDecoration(
                labelText: '이메일',
              ),
            ),
            TextField(
              decoration: InputDecoration(
                labelText: '인증번호',
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
              child: Text('재설정'),
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
