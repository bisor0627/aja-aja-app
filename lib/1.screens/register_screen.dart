import 'package:ajaaja_app/index.dart';

class RegisterScreen extends ConsumerWidget {
  const RegisterScreen({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              '회원가입',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            TextFormField(
              decoration: InputDecoration(
                labelText: '이메일',
              ),
            ),
            TextFormField(
              obscureText: true,
              decoration: InputDecoration(
                labelText: '비밀번호',
              ),
            ),
            TextFormField(
              obscureText: true,
              decoration: InputDecoration(
                labelText: '비밀번호 확인',
              ),
            ),
            CheckboxListTile(
              controlAffinity: ListTileControlAffinity.leading,
              checkboxShape: const CircleBorder(),
              title: const Text('이용약관 동의 >'),
              value: true,
              onChanged: (bool? value) {
                const TermsRoute().push(context);
              },
            ),
            CheckboxListTile(
              controlAffinity: ListTileControlAffinity.leading,
              checkboxShape: const CircleBorder(),
              title: const Text('개인정보처리 이용안내 동의 >'),
              value: true,
              onChanged: (bool? value) {
                const PrivacyRoute().push(context);
              },
            ),
            ElevatedButton(
              onPressed: () {
                const LoginRoute().go(context);
              },
              style: const ButtonStyle().infinity,
              child: const Text('회원가입'),
            ),
          ],
        ),
      ),
    );
  }
}
