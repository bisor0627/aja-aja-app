import 'package:ajaaja_app/utils/extensions/string.dart';
import 'package:ajaaja_app/utils/labels.dart';

import '../index.dart';

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _LoginPageState();
}

class _LoginPageState extends ConsumerState<LoginScreen> {
  late TextEditingController emailController;
  late TextEditingController passwordController;

  final emailEditProvider = StateNotifierProvider<LocalTextEditNotifier, String>((ref) {
    return LocalTextEditNotifier();
  });
  final passwordEditProvider = StateNotifierProvider<LocalTextEditNotifier, String>((ref) {
    return LocalTextEditNotifier();
  });
  final loginButtonProvider = StateNotifierProvider<LocalEnableNotifier, bool>((ref) {
    return LocalEnableNotifier();
  });

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
    ref.listen<AsyncValue<AuthStates>>(
      authAsyncNotifierProvider,
      (_, state) => state.whenOrNull(
        data: (data) {
          if (data == AuthStates.error) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('로그인에 실패했습니다.')),
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
    return Scaffold(
      body: Center(
        child: state.when(
          data: (data) => login(context),
          error: (error, stackTrace) => login(context),
          loading: () => login(context),
        ),
      ),
    );
  }

  Column login(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          '로그인',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Consumer(
            builder: (context, ref, child) {
              String email = ref.watch(emailEditProvider);
              return TextFormField(
                controller: emailController,
                decoration: InputDecoration(
                    labelText: '이메일',
                    errorText: (emailController.text != '' && !emailController.text.isEmail)
                        ? Labels.incorrect_email_format.text
                        : null),
                onChanged: (value) {
                  ref.read(emailEditProvider.notifier).setText(emailController.text);
                  ref
                      .read(loginButtonProvider.notifier)
                      .checkEnable(emailController.text.isEmail && passwordController.text.isPassword);
                },
                keyboardType: TextInputType.text,
              );
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Consumer(
            builder: (context, ref, child) {
              String password = ref.watch(passwordEditProvider);
              return TextFormField(
                controller: passwordController,
                obscureText: true,
                decoration: InputDecoration(
                    labelText: '비밀번호',
                    errorText: (passwordController.text != '' && !passwordController.text.isPassword)
                        ? Labels.incorrect_password_format.text
                        : null),
                onChanged: (value) {
                  ref.read(passwordEditProvider.notifier).setText(value);
                  ref
                      .read(loginButtonProvider.notifier)
                      .checkEnable(emailController.text.isEmail && passwordController.text.isPassword);
                },
                keyboardType: TextInputType.text,
              );
            },
          ),
        ),
        Consumer(
          builder: (context, ref, child) {
            bool isButtonEnabled = ref.watch(loginButtonProvider);
            return ElevatedButton(
              style: const ButtonStyle().infinity,
              onPressed: isButtonEnabled
                  ? () {
                      ref.read(authAsyncNotifierProvider.notifier).signIn(emailController.text);
                    }
                  : null,
              child: const Text('로그인'),
            );
          },
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
    );
  }
}
