import 'package:ajaaja_app/privacy_policy_screen.dart';
import 'package:ajaaja_app/terms_screen.dart';

import 'index.dart';

export 'package:go_router/go_router.dart';

part 'routers.g.dart';

final GlobalKey<NavigatorState> rootNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'root');
final GlobalKey<NavigatorState> shellNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'shell');

class _Routes {
  //snake_case
  static const String splash = '/splash_screen';
  static const String components = '/components_screen';
  static const String login = '/login_screen';
  static const String register = '/register_screen';
  static const String resetPassword = '/reset_password_screen';

  static const String terms = '/terms_screen';
  static const String privacy = '/privacy_screen';

  static const String question = '/question_screen';
  static const String record = '/record_screen';
  static const String profile = '/profile_screen';
  static const String networkDisconnected = '/network_disconnected_screen';
  static const String updateRequired = '/update_required_screen';
  static const String storageCapacityInsufficient = '/storage_capacity_insufficient_screen';
}

@TypedGoRoute<SplashRoute>(
  path: _Routes.splash,
)
class SplashRoute extends GoRouteData {
  const SplashRoute();
  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    return const MaterialPage(child: SplashScreen());
  }
}

//Login
@TypedGoRoute<LoginRoute>(
  path: _Routes.login,
)
class LoginRoute extends GoRouteData {
  const LoginRoute();
  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    return const MaterialPage(child: LoginScreen());
  }
}

@TypedGoRoute<RegisterRoute>(
  path: _Routes.register,
)
class RegisterRoute extends GoRouteData {
  const RegisterRoute();
  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    return const MaterialPage(child: RegisterScreen());
  }
}

@TypedGoRoute<ResetPasswordRoute>(
  path: _Routes.resetPassword,
)
class ResetPasswordRoute extends GoRouteData {
  const ResetPasswordRoute();
  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    return const MaterialPage(child: ResetPasswordScreen());
  }
}

@TypedGoRoute<TermsRoute>(
  path: _Routes.terms,
)
class TermsRoute extends GoRouteData {
  const TermsRoute();
  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    return const MaterialPage(child: TermsScreen());
  }
}

@TypedGoRoute<PrivacyRoute>(
  path: _Routes.privacy,
)
class PrivacyRoute extends GoRouteData {
  const PrivacyRoute();
  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    return const MaterialPage(child: PrivacyScreen());
  }
}

@TypedShellRoute<TabScreenShell>(
  routes: <TypedRoute<RouteData>>[
    TypedGoRoute<QuestionRoute>(path: _Routes.question),
    TypedGoRoute<RecordRoute>(path: _Routes.record),
    TypedGoRoute<ProfileRoute>(path: _Routes.profile),
  ],
)
class TabScreenShell extends ShellRouteData {
  const TabScreenShell();
  static final GlobalKey<NavigatorState> $navigatorKey = shellNavigatorKey;
  @override
  Page<void> pageBuilder(BuildContext context, GoRouterState state, Widget navigator) {
    return MaterialPage(
      key: state.pageKey,
      child: TabScreen(child: navigator),
    );
  }
}

class QuestionRoute extends GoRouteData {
  const QuestionRoute();
  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    return const MaterialPage(child: QuestionScreen());
  }
}

class RecordRoute extends GoRouteData {
  const RecordRoute();
  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    return const MaterialPage(child: RecordScreen());
  }
}

class ProfileRoute extends GoRouteData {
  const ProfileRoute();
  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    return const MaterialPage(child: ProfileScreen());
  }
}

// 에러 스크린들

@TypedGoRoute<NetworkDisconnectedScreenRoute>(
  path: _Routes.networkDisconnected,
)
class NetworkDisconnectedScreenRoute extends GoRouteData {
  const NetworkDisconnectedScreenRoute();
  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    return const MaterialPage(child: NetworkDisconnectedScreen());
  }
}

@TypedGoRoute<UpdateRequiredScreenRoute>(
  path: _Routes.updateRequired,
)
class UpdateRequiredScreenRoute extends GoRouteData {
  const UpdateRequiredScreenRoute();
  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    return const MaterialPage(child: UpdateRequiredScreen());
  }
}

@TypedGoRoute<StorageCapacityInsufficientScreenRoute>(
  path: _Routes.storageCapacityInsufficient,
)
class StorageCapacityInsufficientScreenRoute extends GoRouteData {
  const StorageCapacityInsufficientScreenRoute();
  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    return const MaterialPage(child: StorageCapacityInsufficientScreen());
  }
}

@TypedGoRoute<ComponentsRoute>(
  path: _Routes.components,
)
class ComponentsRoute extends GoRouteData {
  const ComponentsRoute();
  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    return const MaterialPage(child: ComponentsScreen());
  }
}
