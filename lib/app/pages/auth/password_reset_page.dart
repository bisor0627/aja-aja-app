import 'package:base_repo/app/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ResetPasswordPage extends ConsumerWidget {
  const ResetPasswordPage({super.key});
  static String get routeName => 'resetPassword';
  static String get routeLocation => '/$routeName';
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(title: const Text('비밀번호 재설정')),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const TextField(
                decoration: InputDecoration(
                  labelText: '휴대폰번호',
                ),
              ),
              const TextField(
                decoration: InputDecoration(
                  labelText: '이메일',
                ),
              ),
              const TextField(
                decoration: InputDecoration(
                  labelText: '인증번호',
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
                child: const Text('재설정'),
                onPressed: () {
                  ref.read(routerProvider).go(LoginPage.routeLocation);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
