import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '/provider/auth_provider.dart';
import 'pages/auth/auth.dart';
import 'pages/home/home.dart';
import 'pages/splash_page.dart';

export 'package:go_router/go_router.dart';

export 'pages/auth/auth.dart';
export 'pages/home/home.dart';
export 'pages/splash_page.dart';

final GlobalKey<NavigatorState> _rootNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'root');
final GlobalKey<NavigatorState> _shellNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'shell');

final routerProvider = Provider<GoRouter>((ref) {
  final authState = ref.watch(streamAuthProvider);
  return GoRouter(
    navigatorKey: _rootNavigatorKey,
    debugLogDiagnostics: true,
    initialLocation: SplashPage.routeLocation,
    routes: [
      GoRoute(
          path: SplashPage.routeLocation,
          name: SplashPage.routeName,
          builder: (BuildContext context, GoRouterState state) =>
              const SplashPage()),
      GoRoute(
        path: LoginPage.routeLocation,
        name: LoginPage.routeName,
        builder: (BuildContext context, GoRouterState state) =>
            const LoginPage(),
      ),
      GoRoute(
        path: RegisterPage.routeLocation,
        name: RegisterPage.routeName,
        builder: (BuildContext context, GoRouterState state) =>
            const RegisterPage(),
      ),
      GoRoute(
        path: ResetPasswordPage.routeLocation,
        name: ResetPasswordPage.routeName,
        builder: (BuildContext context, GoRouterState state) =>
            const ResetPasswordPage(),
      ),
      ShellRoute(
          navigatorKey: _shellNavigatorKey,
          pageBuilder: (context, state, child) {
            return MaterialPage(
              key: state.pageKey,
              child: TabPage(child: child),
            );
          },
          routes: [
            GoRoute(
              path: QuestionPage.routeLocation,
              name: QuestionPage.routeName,
              builder: (BuildContext context, GoRouterState state) =>
                  const QuestionPage(),
            ),
            GoRoute(
              path: RecordPage.routeLocation,
              name: RecordPage.routeName,
              builder: (BuildContext context, GoRouterState state) =>
                  const RecordPage(),
            ),
            GoRoute(
              path: ProfilePage.routeLocation,
              name: ProfilePage.routeName,
              builder: (BuildContext context, GoRouterState state) =>
                  const ProfilePage(),
            ),
          ]),
    ],
    redirect: (BuildContext context, GoRouterState state) async {
      final bool isAuth = await authState.isSignedIn();
      final isSplash = state.location == SplashPage.routeLocation;
      if (isSplash) {
        return isAuth ? QuestionPage.routeLocation : LoginPage.routeLocation;
      }
      final isLoggingIn = state.location == LoginPage.routeLocation;
      if (isLoggingIn) {
        return isAuth ? QuestionPage.routeLocation : null;
      }
      return null;
    },
  );
});
