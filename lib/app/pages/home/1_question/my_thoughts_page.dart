import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MyThoughtsPage extends ConsumerWidget {
  const MyThoughtsPage({super.key});
  static String get routeName => 'myThoughts';
  static String get routeLocation => '/$routeName';
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const Scaffold(
      body: Center(
        child: Text('MyThoughtsPage'),
      ),
    );
  }
}
