import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class NavigationFramePage extends ConsumerWidget {
  const NavigationFramePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(title: Text('네비게이션 프레임')),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: '오늘의 질문',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            label: '내가 남긴 기록',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            label: '내 정보',
          ),
        ],
// onTap: () {}, // 탭 변경에 따른 로직
      ),
      body: Center(
        child: Text('네비게이션 프레임'),
      ),
    );
  }
}
