import 'package:base_repo/provider/auth_provider.dart';
import 'package:base_repo/shared/widgets/clear_button.dart';
import 'package:base_repo/theme/app/component_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../router.dart';

class LoginPage extends ConsumerStatefulWidget {
  const LoginPage({super.key});
  static String get routeName => 'login';
  static String get routeLocation => '/$routeName';
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _LoginPageState();
}

class _LoginPageState extends ConsumerState<LoginPage> {
  late TextEditingController phoneController;
  late TextEditingController passwordController;
  @override
  void initState() {
    phoneController = TextEditingController();
    passwordController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    phoneController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('로그인')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(smallSpacing),
              child: TextField(
                controller: phoneController,
                decoration: InputDecoration(
                  suffixIcon: ClearButton(controller: phoneController),
                  filled: true,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(smallSpacing),
              child: TextField(
                controller: phoneController,
                decoration: InputDecoration(
                  suffixIcon: ClearButton(controller: phoneController),
                  filled: true,
                ),
              ),
            ),
            TextButton(
              child: const Text('비밀번호 재설정'),
              onPressed: () {
                ref.read(routerProvider).go(ResetPasswordPage.routeLocation);
              },
            ),
            TextButton(
              child: const Text('회원가입'),
              onPressed: () {
                ref.read(routerProvider).go(RegisterPage.routeLocation);
              },
            ),
            ElevatedButton(
              child: const Text('로그인'),
              onPressed: () {
                ref.read(streamAuthProvider).signIn(phoneController.text);
              },
            ),
          ],
        ),
      ),
    );
  }
}
