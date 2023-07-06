import 'package:ajaaja_app/theme/color/color_schemes.dart';
import 'package:dynamic_color/dynamic_color.dart';

import 'flavors.dart';
import 'index.dart';

class App extends ConsumerWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(routerProvider);
    return DynamicColorBuilder(builder: (ColorScheme? lightDynamic, ColorScheme? darkDynamic) {
      ColorScheme light;
      ColorScheme dark;

      /// 시스템이 동적 [ColorScheme]을 제공하는 경우
      if (lightDynamic != null && darkDynamic != null) {
        light = lightDynamic.harmonized();
        dark = darkDynamic.harmonized();

        /// 시스템이 동적 [ColorScheme]을 제공하지 않는 경우
      } else {
        /// [ColorScheme]을 직접 정의한 경우
        light = lightColorScheme.harmonized();
        dark = darkColorScheme;

        /// [ColorScheme]을 직접 정의하지 않은 경우
        /// ```dart
        /// light = lightColorScheme ?? ColorScheme.fromSeed(
        ///  seedColor: seedColor,
        /// );
        /// dark = darkColorScheme ?? ColorScheme.fromSeed(
        /// seedColor: seedColor,
        /// brightness: Brightness.dark,
        /// );
      }

      return MaterialApp.router(
        routerConfig: router,
        title: F.title,
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: light,
        ),
        darkTheme: ThemeData(
          useMaterial3: true,
          colorScheme: dark,
        ),
        builder: (context, child) {
          return _flavorBanner(
            child: child!,
            ref: ref,
            show: F.appFlavor != Flavor.prod ? true : false,
          );
        },
      );
    });
  }

  Widget _flavorBanner({
    required Widget child,
    required WidgetRef ref,
    bool show = true,
  }) =>
      show
          ? GestureDetector(
              onLongPress: () {
                ref.read(appStatusAsyncNotifierProvider.notifier).componentsCheck();
              },
              child: Banner(
                location: BannerLocation.bottomStart,
                message: F.name,
                color: Colors.green.withOpacity(0.6),
                textStyle: const TextStyle(fontWeight: FontWeight.w700, fontSize: 12.0, letterSpacing: 1.0),
                textDirection: TextDirection.ltr,
                child: child,
              ),
            )
          : Container(
              child: child,
            );
}
/**
   ButtonStyle basic(BuildContext context) => ButtonStyle(
        textStyle: MaterialStateProperty.all<TextStyle>(
          Theme.of(context).textTheme.bodyLarge!,
        ),
        // backgroundColor: MaterialStateProperty.all<Color>(
        //   Theme.of(context).colorScheme.primary,
        // ),
        // foregroundColor: MaterialStateProperty.all<Color>(
        //   Theme.of(context).colorScheme.onPrimary,
        // ),
      );
 */