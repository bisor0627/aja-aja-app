import '../index.dart';

class SplashScreen extends ConsumerWidget {
  const SplashScreen({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
