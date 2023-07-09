import 'package:ajaaja_app/utils/texts.dart';

import '../index.dart';
import '../utils/regexp.dart';

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _LoginPageState();
}

class _LoginPageState extends ConsumerState<LoginScreen> {
  late TextEditingController emailController;
  late TextEditingController passwordController;
  @override
  void initState() {
    emailController = TextEditingController();
    passwordController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(authAsyncNotifierProvider);
    return Scaffold(
      body: Center(
        child: state.when(
          data: (data) => Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                '로그인',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextFormField(
                  controller: emailController,
                  decoration: InputDecoration(
                      labelText: '이메일',
                      errorText: (emailController.text != '' && !RegExp(RegExpEMAIL).hasMatch(emailController.text))
                          ? Labels.incorrect_email_format.text
                          : null),
                  keyboardType: TextInputType.text,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextFormField(
                  controller: passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                      labelText: '비밀번호',
                      errorText: (passwordController.text != '' &&
                              !RegExp(RegExpCheckPASSWORD).hasMatch(passwordController.text))
                          ? Labels.incorrect_password_format.text
                          : null),
                  keyboardType: TextInputType.text,
                ),
              ),
              ElevatedButton(
                style: const ButtonStyle().infinity,
                onPressed: () {
                  ref.read(authAsyncNotifierProvider.notifier).signIn(emailController.text);
                },
                child: const Text('로그인'),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    child: const Text('비밀번호 재설정'),
                    onPressed: () {
                      const ResetPasswordRoute().go(context);
                    },
                  ),
                  TextButton(
                    child: const Text('회원가입'),
                    onPressed: () {
                      const RegisterRoute().go(context);
                    },
                  ),
                ],
              ),
            ],
          ),
          error: (error, stackTrace) => Center(child: Text(error.toString())),
          loading: () => const Center(child: CircularProgressIndicator()),
        ),
      ),
    );
  }
}
