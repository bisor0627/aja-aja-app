import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MyThoughtsPage extends ConsumerWidget {
  const MyThoughtsPage({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const Scaffold(
      body: Center(
        child: Text('MyThoughtsPage'),
      ),
    );
  }
}
