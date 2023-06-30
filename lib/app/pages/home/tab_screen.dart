import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../provider/provider.dart';
import '../../routers.dart';

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
        selectedIndex: _calculateSelectedIndex(ref),
        destinations: const <NavigationDestination>[
          NavigationDestination(
            // selectedIcon: Icon(Icons.home),
            icon: Icon(Icons.home),
            label: '오늘의 질문',
          ),
          NavigationDestination(
            // selectedIcon: Icon(Icons.home),
            icon: Icon(Icons.business),
            label: '내가 남긴 기록',
          ),
          NavigationDestination(
            // selectedIcon: Icon(Icons.home),
            icon: Icon(Icons.school),
            label: '내 정보',
          ),
        ],
      ),
    );
  }

  int _calculateSelectedIndex(WidgetRef ref) {
    final GoRouter route = ref.watch(routerProvider);
    final String location = route.location;
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
