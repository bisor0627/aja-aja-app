import 'package:base_repo/shared/widgets/clear_button.dart';
import 'package:base_repo/theme/app/component_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LoginPage extends ConsumerStatefulWidget {
  const LoginPage({super.key});

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
      appBar: AppBar(title: Text('로그인')),
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
              child: Text('비밀번호 재설정'),
              onPressed: () {
                // context.go(Routes.resetPassword);
              },
            ),
            TextButton(
              child: Text('회원가입'),
              onPressed: () {
                // context.go(Routes.signup);
              },
            ),
            ElevatedButton(
              child: Text('로그인'),
              onPressed: () {
                // context.go(Routes.navigationFrame);
              },
            ),
          ],
        ),
      ),
    );
  }
}
