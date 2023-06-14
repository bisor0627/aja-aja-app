import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SaintThoughtsPage extends ConsumerWidget {
  const SaintThoughtsPage({super.key});
  static String get routeName => 'saintThoughts';
  static String get routeLocation => '/$routeName';
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const Scaffold(
      body: Center(
        child: Text('SaintThoughtsPage'),
      ),
    );
  }
}
