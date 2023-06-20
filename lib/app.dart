import 'package:dynamic_color/dynamic_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'app/router.dart';
import 'flavors.dart';
import 'theme/theme.dart';

class App extends ConsumerWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(routerProvider);
    return DynamicColorBuilder(
        builder: (ColorScheme? lightDynamic, ColorScheme? darkDynamic) {
      ColorScheme lightScheme;
      ColorScheme darkScheme;

      if (lightDynamic != null && darkDynamic != null) {
        lightScheme = lightDynamic.harmonized();

        darkScheme = darkDynamic.harmonized();
      } else {
        lightScheme = lightColorScheme;
        darkScheme = darkColorScheme;
      }
      return MaterialApp.router(
        routeInformationParser: router.routeInformationParser,
        routerDelegate: router.routerDelegate,
        routeInformationProvider: router.routeInformationProvider,
        title: F.title,
        themeMode: ThemeMode.system,
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: lightScheme,
          useMaterial3: true,
          brightness: Brightness.light,
        ),
        darkTheme: ThemeData(
          colorScheme: darkScheme,
          extensions: [],
          useMaterial3: true,
          brightness: Brightness.dark,
        ),
        // builder: (context, child) {
        //   return Banner(
        //     location: BannerLocation.topStart,
        //     message: F.name,
        //     color: Colors.red,
        //     textDirection: TextDirection.ltr,
        //     child: child,
        //   );
        // },
      );
    });
  }
}
