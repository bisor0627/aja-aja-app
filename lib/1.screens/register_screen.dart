import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../routers.dart';

class RegisterScreen extends ConsumerWidget {
  const RegisterScreen({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(title: const Text('회원가입')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const TextField(
              decoration: InputDecoration(
                labelText: '휴대폰번호',
              ),
            ),
            const TextField(
              obscureText: true,
              decoration: InputDecoration(
                labelText: '비밀번호',
              ),
            ),
            const TextField(
              obscureText: true,
              decoration: InputDecoration(
                labelText: '비밀번호 확인',
              ),
            ),
            ElevatedButton(
              child: const Text('회원가입'),
              onPressed: () {
                const LoginRoute().go(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
