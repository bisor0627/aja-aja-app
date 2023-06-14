import 'package:base_repo/app/pages/authenticated/authenticated.dart';
import 'package:base_repo/app/pages/unauthenticated/unauthenticated.dart';
import 'package:base_repo/provider/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import 'pages/splash_page.dart';

export 'package:go_router/go_router.dart';

export 'pages/authenticated/authenticated.dart';
export 'pages/splash_page.dart';
export 'pages/unauthenticated/unauthenticated.dart';

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
              path: TodayQuestionPage.routeLocation,
              name: TodayQuestionPage.routeName,
              builder: (BuildContext context, GoRouterState state) =>
                  const TodayQuestionPage(),
            ),
            GoRoute(
              path: RecordPage.routeLocation,
              name: RecordPage.routeName,
              builder: (BuildContext context, GoRouterState state) =>
                  const RecordPage(),
            ),
            GoRoute(
              path: MyProfilePage.routeLocation,
              name: MyProfilePage.routeName,
              builder: (BuildContext context, GoRouterState state) =>
                  const MyProfilePage(),
            ),
          ]),
    ],
    redirect: (BuildContext context, GoRouterState state) async {
      final bool isAuth = await authState.isSignedIn();
      final isSplash = state.location == SplashPage.routeLocation;
      if (isSplash) {
        return isAuth
            ? TodayQuestionPage.routeLocation
            : LoginPage.routeLocation;
      }
      final isLoggingIn = state.location == LoginPage.routeLocation;
      if (isLoggingIn) {
        return isAuth ? TodayQuestionPage.routeLocation : null;
      }
      return null;
    },
  );
});
