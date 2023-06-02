import 'package:base_repo/theme/app/theme_app.dart';
import 'package:flutter/material.dart';

import 'flavors.dart';

void main() {
  F.appFlavor = Flavor.theme;
  runApp(const ThemeApp());
}
