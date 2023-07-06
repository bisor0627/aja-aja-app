// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'routers.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<RouteBase> get $appRoutes => [
      $splashRoute,
      $loginRoute,
      $registerRoute,
      $resetPasswordRoute,
      $networkDisconnectedScreenRoute,
      $updateRequiredScreenRoute,
      $storageCapacityInsufficientScreenRoute,
      $componentsRoute,
      $tabScreenShell,
    ];

RouteBase get $splashRoute => GoRouteData.$route(
      path: '/splash_screen',
      factory: $SplashRouteExtension._fromState,
    );

extension $SplashRouteExtension on SplashRoute {
  static SplashRoute _fromState(GoRouterState state) => const SplashRoute();

  String get location => GoRouteData.$location(
        '/splash_screen',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) => context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $loginRoute => GoRouteData.$route(
      path: '/login_screen',
      factory: $LoginRouteExtension._fromState,
    );

extension $LoginRouteExtension on LoginRoute {
  static LoginRoute _fromState(GoRouterState state) => const LoginRoute();

  String get location => GoRouteData.$location(
        '/login_screen',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) => context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $registerRoute => GoRouteData.$route(
      path: '/register_screen',
      factory: $RegisterRouteExtension._fromState,
    );

extension $RegisterRouteExtension on RegisterRoute {
  static RegisterRoute _fromState(GoRouterState state) => const RegisterRoute();

  String get location => GoRouteData.$location(
        '/register_screen',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) => context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $resetPasswordRoute => GoRouteData.$route(
      path: '/reset_password_screen',
      factory: $ResetPasswordRouteExtension._fromState,
    );

extension $ResetPasswordRouteExtension on ResetPasswordRoute {
  static ResetPasswordRoute _fromState(GoRouterState state) => const ResetPasswordRoute();

  String get location => GoRouteData.$location(
        '/reset_password_screen',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) => context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $networkDisconnectedScreenRoute => GoRouteData.$route(
      path: '/network_disconnected_screen',
      factory: $NetworkDisconnectedScreenRouteExtension._fromState,
    );

extension $NetworkDisconnectedScreenRouteExtension on NetworkDisconnectedScreenRoute {
  static NetworkDisconnectedScreenRoute _fromState(GoRouterState state) => const NetworkDisconnectedScreenRoute();

  String get location => GoRouteData.$location(
        '/network_disconnected_screen',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) => context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $updateRequiredScreenRoute => GoRouteData.$route(
      path: '/update_required_screen',
      factory: $UpdateRequiredScreenRouteExtension._fromState,
    );

extension $UpdateRequiredScreenRouteExtension on UpdateRequiredScreenRoute {
  static UpdateRequiredScreenRoute _fromState(GoRouterState state) => const UpdateRequiredScreenRoute();

  String get location => GoRouteData.$location(
        '/update_required_screen',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) => context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $storageCapacityInsufficientScreenRoute => GoRouteData.$route(
      path: '/storage_capacity_insufficient_screen',
      factory: $StorageCapacityInsufficientScreenRouteExtension._fromState,
    );

extension $StorageCapacityInsufficientScreenRouteExtension on StorageCapacityInsufficientScreenRoute {
  static StorageCapacityInsufficientScreenRoute _fromState(GoRouterState state) =>
      const StorageCapacityInsufficientScreenRoute();

  String get location => GoRouteData.$location(
        '/storage_capacity_insufficient_screen',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) => context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $componentsRoute => GoRouteData.$route(
      path: '/components_screen',
      factory: $ComponentsRouteExtension._fromState,
    );

extension $ComponentsRouteExtension on ComponentsRoute {
  static ComponentsRoute _fromState(GoRouterState state) => const ComponentsRoute();

  String get location => GoRouteData.$location(
        '/components_screen',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) => context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $tabScreenShell => ShellRouteData.$route(
      factory: $TabScreenShellExtension._fromState,
      navigatorKey: TabScreenShell.$navigatorKey,
      routes: [
        GoRouteData.$route(
          path: '/question_screen',
          factory: $QuestionRouteExtension._fromState,
        ),
        GoRouteData.$route(
          path: '/record_screen',
          factory: $RecordRouteExtension._fromState,
        ),
        GoRouteData.$route(
          path: '/profile_screen',
          factory: $ProfileRouteExtension._fromState,
        ),
      ],
    );

extension $TabScreenShellExtension on TabScreenShell {
  static TabScreenShell _fromState(GoRouterState state) => const TabScreenShell();
}

extension $QuestionRouteExtension on QuestionRoute {
  static QuestionRoute _fromState(GoRouterState state) => const QuestionRoute();

  String get location => GoRouteData.$location(
        '/question_screen',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) => context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $RecordRouteExtension on RecordRoute {
  static RecordRoute _fromState(GoRouterState state) => const RecordRoute();

  String get location => GoRouteData.$location(
        '/record_screen',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) => context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $ProfileRouteExtension on ProfileRoute {
  static ProfileRoute _fromState(GoRouterState state) => const ProfileRoute();

  String get location => GoRouteData.$location(
        '/profile_screen',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) => context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}
