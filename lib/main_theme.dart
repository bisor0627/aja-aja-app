import 'package:flutter/material.dart';

import 'flavors.dart';
import 'theme/app/theme_app.dart';

void main() {
  F.appFlavor = Flavor.theme;
  runApp(const ThemeApp());
}
