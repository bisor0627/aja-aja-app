import 'package:base_repo/app/pages/authenticated/authenticated.dart';
import 'package:base_repo/app/pages/unauthenticated/unauthenticated.dart';
import 'package:base_repo/state/auth_state.dart';
import 'package:dynamic_color/dynamic_color.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'app/pages/splash_page.dart';
import 'app/router.dart';
import 'flavors.dart';
import 'theme/theme.dart';

class App extends StatelessWidget {
  App({super.key});
  late final GoRouter _router = GoRouter(
    routes: [
      GoRoute(
          path: Routes.splash,
          builder: (BuildContext context, GoRouterState state) =>
              const SplashPage()),
      GoRoute(
        path: Routes.login,
        builder: (BuildContext context, GoRouterState state) =>
            const LoginPage(),
      ),
      GoRoute(
        path: Routes.signup,
        builder: (BuildContext context, GoRouterState state) =>
            const SignUpPage(),
      ),
      GoRoute(
        path: Routes.resetPassword,
        builder: (BuildContext context, GoRouterState state) =>
            const ResetPasswordPage(),
      ),
      GoRoute(
        path: Routes.navigationFrame,
        builder: (BuildContext context, GoRouterState state) =>
            const NavigationFramePage(),
        routes: [
          GoRoute(
            path: Routes.todayQuestion,
            builder: (BuildContext context, GoRouterState state) =>
                const TodayQuestionPage(),
          ),
          GoRoute(
            path: Routes.viewRecord,
            builder: (BuildContext context, GoRouterState state) =>
                const ViewRecordPage(),
          ),
          GoRoute(
            path: Routes.viewProfile,
            builder: (BuildContext context, GoRouterState state) =>
                const ViewProfilePage(),
          ),
        ],
      ),
    ],
    redirect: (BuildContext context, GoRouterState state) async {
      final bool loggedIn = await isSignedIn();
      final bool loggingIn = state.matchedLocation == Routes.login;
      if (!loggedIn) {
        return Routes.login;
      }
      if (loggingIn) {
        return Routes.splash;
      }
      return null;
    },
  );

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
      return MaterialApp.router(
        routerConfig: _router,
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
          useMaterial3: true,
          brightness: Brightness.dark,
        ),
        builder: (context, child) {
          return _flavorBanner(
            child: child ?? const SizedBox.shrink(),
            show: kDebugMode,
          );
        },
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
