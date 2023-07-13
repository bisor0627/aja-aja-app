import 'dart:math';

import 'package:ajaaja_app/index.dart';
import 'package:ajaaja_app/utils/extensions/string.dart';

import '../utils/labels.dart';

class ResetPasswordScreen extends ConsumerStatefulWidget {
  const ResetPasswordScreen({super.key});

  @override
  ConsumerState<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends ConsumerState<ResetPasswordScreen> {
  late TextEditingController emailController;
  late TextEditingController passwordController;
  late TextEditingController passwordConfirmationController;
  bool isEmailValidated = false;
  bool enabled = false;

  @override
  void initState() {
    emailController = TextEditingController();
    passwordController = TextEditingController();
    passwordConfirmationController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    passwordConfirmationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: FocusScope.of(context).unfocus,
      child: Scaffold(
        appBar: AppBar(),
        body: Center(
          child: resetPassword(context),
        ),
      ),
    );
  }

  Widget resetPassword(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              '비밀번호 재설정',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: emailController,
                enabled: !isEmailValidated,
                decoration: InputDecoration(
                  labelText: '이메일',
                  suffixIcon: IconButton(
                    icon: const Icon(Icons.check),
                    onPressed: !isEmailValidated && emailController.text.isEmail
                        ? () async {
                            if ((Random().nextInt(2) + 1) == 1) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text('이메일이 존재하지 않습니다.')),
                              );
                            } else {
                              setState(() {
                                isEmailValidated = true;
                              });
                            }
                          }
                        : null,
                  ),
                ),
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: (value) => value == '' || value!.isEmail ? null : Labels.incorrect_email_format.text,
                keyboardType: TextInputType.emailAddress,
                onChanged: (value) => enableCheck(),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: '새로운 비밀번호',
                ),
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: (value) => value == '' || value!.isPassword ? null : Labels.incorrect_password_format.text,
                keyboardType: TextInputType.visiblePassword,
                onChanged: (value) => enableCheck(),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                obscureText: true,
                controller: passwordConfirmationController,
                decoration: InputDecoration(
                  labelText: '비밀번호 확인',
                ),
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: (value) =>
                    value == '' || value! == passwordController.text ? null : Labels.password_not_match.text,
                keyboardType: TextInputType.visiblePassword,
                onChanged: (value) => enableCheck(),
              ),
            ),
            ElevatedButton(
              onPressed: enabled
                  ? () {
                      const LoginRoute().go(context);
                    }
                  : null,
              style: const ButtonStyle().infinity,
              child: const Text('비밀번호 재설정하기'),
            ),
          ],
        ),
      ),
    );
  }

  void enableCheck() => setState(() {
        enabled = isEmailValidated &&
            emailController.text.isEmail &&
            passwordController.text.isPassword &&
            passwordController.text == passwordConfirmationController.text;
      });
}
