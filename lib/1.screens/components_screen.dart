import 'package:ajaaja_app/index.dart';

class ComponentsScreen extends ConsumerStatefulWidget {
  const ComponentsScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ComponentsScreenState();
}

class _ComponentsScreenState extends ConsumerState<ComponentsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Components')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          TextButton(
            onPressed: () async {},
            style: const ButtonStyle().basic(context).infinity,
            child: const Text('basic'),
          ),
          ElevatedButton(
            onPressed: () async {},
            style: const ButtonStyle().basic(context).infinity,
            child: const Text('basic'),
          ),
          OutlinedButton(
            onPressed: () async {},
            style: const ButtonStyle().basic(context),
            child: const Text('basic'),
          ),
          ElevatedButton(
            onPressed: () async {},
            style: const ButtonStyle().accent(context),
            child: const Text('Accent'),
          ),
          ElevatedButton(
            style: const ButtonStyle().warning(context),
            child: const Text('Warning'),
            onPressed: () {},
          ),
          ElevatedButton(
            style: const ButtonStyle().success(context),
            child: const Text('Success'),
            onPressed: () {},
          ),
          ElevatedButton(
            style: const ButtonStyle().disabled(context),
            child: const Text('Disabled'),
            onPressed: () {},
          )
        ],
      ),
    );
  }
}
