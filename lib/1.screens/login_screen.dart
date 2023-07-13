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
  bool enabled = false;

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
    return GestureDetector(
      onTap: FocusScope.of(context).unfocus,
      child: Scaffold(
        body: Center(
          child: state.when(
            data: (data) => login(context),
            error: (error, stackTrace) => login(context),
            loading: () => login(context),
          ),
        ),
      ),
    );
  }

  Widget login(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            '로그인',
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              controller: emailController,
              decoration: const InputDecoration(
                labelText: '이메일',
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
              decoration: const InputDecoration(
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
            child: ElevatedButton(
              style: const ButtonStyle().infinity,
              onPressed: enabled
                  ? () {
                      ref.read(authAsyncNotifierProvider.notifier).signIn(emailController.text);
                    }
                  : null,
              child: const Text('로그인'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                  child: const Text('비밀번호 재설정'),
                  onPressed: () {
                    const ResetPasswordRoute().push(context);
                  },
                ),
                TextButton(
                  child: const Text('회원가입'),
                  onPressed: () {
                    const RegisterRoute().push(context);
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void enableCheck() => setState(() => enabled = emailController.text.isEmail && passwordController.text.isPassword);
}
