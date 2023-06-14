import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../router.dart';

final class TabPage extends ConsumerWidget {
  const TabPage({Key? key, required this.child}) : super(key: key);

  final Widget child;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: child,
      bottomNavigationBar: _navigationBar(ref),
    );
  }

  Widget _navigationBar(WidgetRef ref) {
    return NavigationBar(
      onDestinationSelected: (int idx) => _onItemTapped(idx, ref),
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
    );
  }

  int _calculateSelectedIndex(WidgetRef ref) {
    final GoRouter route = ref.watch(routerProvider);

    final String location = route.location;
    if (location == TodayQuestionPage.routeLocation) {
      return 0;
    } else if (location == RecordPage.routeLocation) {
      return 1;
    } else if (location == MyProfilePage.routeLocation) {
      return 2;
    } else {
      return 0; // Default index if no match
    }
  }

  void _onItemTapped(int index, WidgetRef ref) {
    final GoRouter route = ref.watch(routerProvider);
    switch (index) {
      case 0:
        route.go(TodayQuestionPage.routeLocation);
        break;
      case 1:
        route.go(RecordPage.routeLocation);
        break;
      case 2:
        route.go(MyProfilePage.routeLocation);
        break;
    }
  }
}
