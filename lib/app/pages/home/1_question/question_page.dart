import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class QuestionPage extends ConsumerWidget {
  const QuestionPage({super.key});
  static String get routeName => 'question';
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
