import '../index.dart';

final class TabScreen extends ConsumerWidget {
  const TabScreen({Key? key, required this.child}) : super(key: key);

  final Widget child;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: child,
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (int idx) => _onItemTapped(idx, context),
        selectedIndex: _calculateSelectedIndex(context),
        destinations: const <NavigationDestination>[
          NavigationDestination(
            // selectedIcon: Icon(Icons.home),
            icon: Icon(Icons.home),
            label: 'First',
          ),
          NavigationDestination(
            // selectedIcon: Icon(Icons.home),
            icon: Icon(Icons.business),
            label: 'Second',
          ),
          NavigationDestination(
            // selectedIcon: Icon(Icons.home),
            icon: Icon(Icons.school),
            label: 'Third',
          ),
        ],
      ),
    );
  }

  int _calculateSelectedIndex(BuildContext context) {
    final String location = GoRouterState.of(context).location;
    if (location == const QuestionRoute().location) {
      return 0;
    } else if (location == const RecordRoute().location) {
      return 1;
    } else if (location == const ProfileRoute().location) {
      return 2;
    } else {
      return 0; // Default index if no match
    }
  }

  void _onItemTapped(int index, BuildContext context) {
    switch (index) {
      case 0:
        const QuestionRoute().go(context);
        break;
      case 1:
        const RecordRoute().go(context);
        break;
      case 2:
        const ProfileRoute().go(context);
        break;
    }
  }
}
