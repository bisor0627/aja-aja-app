import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '/provider/auth_provider.dart';
import '/shared/widgets/clear_button.dart';
import '/theme/app/component_screen.dart';
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
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              '로그인',
              style: Theme.of(context).textTheme.headlineMedium,
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
            ElevatedButton(
              child: const Text('로그인'),
              onPressed: () {
                ref.read(streamAuthProvider).signIn(phoneController.text);
              },
            ),
            Row(
              children: [
                TextButton(
                  child: const Text('비밀번호 재설정'),
                  onPressed: () {
                    ref
                        .read(routerProvider)
                        .go(ResetPasswordPage.routeLocation);
                  },
                ),
                TextButton(
                  child: const Text('회원가입'),
                  onPressed: () {
                    ref.read(routerProvider).go(RegisterPage.routeLocation);
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
