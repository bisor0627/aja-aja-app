import 'dart:math';

import 'package:ajaaja_app/index.dart';
import 'package:ajaaja_app/utils/extensions/string.dart';
import 'package:ajaaja_app/utils/labels.dart';

class RegisterScreen extends ConsumerStatefulWidget {
  const RegisterScreen({super.key});
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends ConsumerState<RegisterScreen> {
  late TextEditingController emailController;
  late TextEditingController passwordController;
  late TextEditingController passwordConfirmationController;
  bool isEmailValidated = false;
  bool isPrivacyChecked = false;
  bool isTermsChecked = false;
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
    final state = ref.watch(authAsyncNotifierProvider);
    ref.listen<AsyncValue<AuthStates>>(
      authAsyncNotifierProvider,
      (_, state) => state.whenOrNull(
        data: (data) {
          if (data == AuthStates.error) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('회원가입에 실패했습니다.')),
            );
          }
        },
        error: (error, _) {
          // show snackbar if an error occurred
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(error.toString())),
          );
        },
        loading: () {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Loading...')),
          );
        },
      ),
    );
    return GestureDetector(
      onTap: FocusScope.of(context).unfocus,
      child: Scaffold(
        appBar: AppBar(),
        body: Center(
          child: state.when(
            data: (data) => register(context),
            error: (error, stackTrace) => register(context),
            loading: () => register(context),
          ),
        ),
      ),
    );
  }

  Widget register(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              '회원가입',
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
                                SnackBar(content: Text('이미 가입된 이메일입니다.')),
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
                  labelText: '비밀번호',
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
            CheckboxListTile(
              controlAffinity: ListTileControlAffinity.leading,
              checkboxShape: const CircleBorder(),
              title: const Text('이용약관 동의 >'),
              value: isTermsChecked,
              onChanged: (bool? value) async {
                isTermsChecked = await const TermsRoute().push(context) ?? false;
                enableCheck();
              },
            ),
            CheckboxListTile(
              controlAffinity: ListTileControlAffinity.leading,
              checkboxShape: const CircleBorder(),
              title: const Text('개인정보처리 이용안내 동의 >'),
              value: isPrivacyChecked,
              onChanged: (bool? value) async {
                isPrivacyChecked = await const PrivacyRoute().push(context) ?? false;
                enableCheck();
              },
            ),
            ElevatedButton(
              onPressed: enabled
                  ? () {
                      const LoginRoute().go(context);
                    }
                  : null,
              style: const ButtonStyle().infinity,
              child: const Text('회원가입'),
            ),
          ],
        ),
      ),
    );
  }

  void enableCheck() => setState(() {
        enabled = isEmailValidated &&
            isTermsChecked &&
            isPrivacyChecked &&
            emailController.text.isEmail &&
            passwordController.text.isPassword &&
            passwordController.text == passwordConfirmationController.text;
      });
}
