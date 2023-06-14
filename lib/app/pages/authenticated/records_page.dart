import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class RecordPage extends ConsumerWidget {
  const RecordPage({super.key});
  static String get routeName => 'record';
  static String get routeLocation => '/$routeName';
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const Scaffold(
      body: Center(
        child: Text('RecordPage'),
      ),
    );
  }
}
