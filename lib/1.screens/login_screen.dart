import '../index.dart';

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _LoginPageState();
}

class _LoginPageState extends ConsumerState<LoginScreen> {
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
                child: TextField(
                  controller: phoneController,
                  decoration: InputDecoration(
                    // suffixIcon: ClearButton(controller: phoneController),
                    border: const OutlineInputBorder(),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextField(
                  controller: passwordController,
                  decoration: InputDecoration(
                    // suffixIcon: ClearButton(controller: passwordController),
                    border: const OutlineInputBorder(),
                  ),
                ),
              ),
              ElevatedButton(
                // style: ElevatedButton.styleFrom(
                //     minimumSize: Size.fromWidth(const MediaQueryData().size.width * 0.8),
                //     ),
                onPressed: () {
                  ref.read(authAsyncNotifierProvider.notifier).signIn(phoneController.text);
                },
                child: const Text('로그인'),
              ),
              Row(
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
