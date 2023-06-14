import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TodayQuestionPage extends ConsumerWidget {
  const TodayQuestionPage({super.key});
  static String get routeName => 'todayQuestion';
  static String get routeLocation => '/$routeName';
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const Scaffold(
      body: Center(
        child: Text('TodayQuestionPage'),
      ),
    );
  }
}
