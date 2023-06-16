import 'package:aja_aja_app/theme/app/theme_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'flavors.dart';

void main() {
  F.appFlavor = Flavor.theme;
  runApp(
    const ProviderScope(
      child: ThemeApp(),
    ),
  );
}
