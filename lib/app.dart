import 'package:dynamic_color/dynamic_color.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'flavors.dart';
import 'pages/my_home_page.dart';
import 'theme/theme.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return DynamicColorBuilder(
        builder: (ColorScheme? lightDynamic, ColorScheme? darkDynamic) {
      ColorScheme lightScheme;
      ColorScheme darkScheme;

      if (lightDynamic != null && darkDynamic != null) {
        lightScheme = lightDynamic.harmonized();
        lightCustomColors = lightCustomColors.harmonized(lightScheme);

        // Repeat for the dark color scheme.
        darkScheme = darkDynamic.harmonized();
        darkCustomColors = darkCustomColors.harmonized(darkScheme);
      } else {
        // Otherwise, use fallback schemes.
        lightScheme = lightColorScheme;
        darkScheme = darkColorScheme;
      }
      return MaterialApp(
        title: F.title,
        themeMode: ThemeMode.system,
        theme: ThemeData(
          colorScheme: lightScheme,
          useMaterial3: true,
          brightness: Brightness.light,
        ),
        darkTheme: ThemeData(
          colorScheme: darkScheme,
          useMaterial3: true,
          brightness: Brightness.dark,
        ),
        home: _flavorBanner(
          child: MyHomePage(),
          show: kDebugMode,
        ),
      );
    });
  }

  Widget _flavorBanner({
    required Widget child,
    bool show = true,
  }) =>
      show
          ? Banner(
              location: BannerLocation.topStart,
              message: F.name,
              color: Colors.green.withOpacity(0.6),
              textStyle: const TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 12.0,
              ),
              textDirection: TextDirection.ltr,
              child: child,
            )
          : Container(
              child: child,
            );
}
