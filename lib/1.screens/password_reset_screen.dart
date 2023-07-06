import 'package:ajaaja_app/index.dart';

class ResetPasswordScreen extends ConsumerWidget {
  const ResetPasswordScreen({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                '비밀번호 재설정',
                style: Theme.of(context).textTheme.headlineMedium,
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
                style: const ButtonStyle().infinity,
                onPressed: () {
                  const LoginRoute().go(context);
                },
                child: const Text('재설정하기'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
