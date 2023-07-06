import '../../index.dart';

sealed class ErrorStatus {
  final String routeLocation;
  ErrorStatus(this.routeLocation);
}

class NoneError extends ErrorStatus {
  NoneError() : super('');
}

class ComponentsCheckMode extends ErrorStatus {
  ComponentsCheckMode() : super(const ComponentsRoute().location);
}

class NetworkDisconnected extends ErrorStatus {
  NetworkDisconnected() : super(const NetworkDisconnectedScreenRoute().location);
}

class UpdateRequired extends ErrorStatus {
  UpdateRequired() : super(const UpdateRequiredScreenRoute().location);
}

class StorageCapacityInsufficient extends ErrorStatus {
  //same upper class
  StorageCapacityInsufficient() : super(const StorageCapacityInsufficientScreenRoute().location);
}

class NetworkDisconnectedScreen extends ConsumerWidget {
  const NetworkDisconnectedScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Center(
        child: Text(
          '네트워크가 연결되지 않았습니다.',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.go(path.first);
        },
        child: const Icon(Icons.refresh),
      ),
    );
  }
}

class UpdateRequiredScreen extends ConsumerWidget {
  const UpdateRequiredScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Center(
        child: Text(
          '앱 업데이트가 필요합니다.',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.go(path.first);
        },
        child: const Icon(Icons.refresh),
      ),
    );
  }
}

class StorageCapacityInsufficientScreen extends ConsumerWidget {
  const StorageCapacityInsufficientScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Center(
        child: Text(
          '스토리지 용량이 부족합니다.',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.go(path.first);
        },
        child: const Icon(Icons.refresh),
      ),
    );
  }
}
