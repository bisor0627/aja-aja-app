import 'package:ajaaja_app/index.dart';

class ProfileScreen extends ConsumerWidget {
  const ProfileScreen({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(authAsyncNotifierProvider);

    return Scaffold(
      body: Center(
        child: state.when(
          data: (data) => Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text('ProfilePage'),
              ElevatedButton(
                onPressed: () async {
                  await ref.read(authAsyncNotifierProvider.notifier).signOut();
                },
                style: const ButtonStyle().basic(context).infinity,
                child: const Text('basic'),
              ),
            ],
          ),
          error: (_, __) => CircularProgressIndicator(
            color: Theme.of(context).colorScheme.error,
          ),
          loading: () => const CircularProgressIndicator(),
        ),
      ),
    );
  }
}
