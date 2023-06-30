import 'dart:async';

import 'package:aja_aja_app/util/enums.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../app/pages/pages.dart';
import '../../app/routers.dart';
import '../app_status_provider.dart';

export 'package:go_router/go_router.dart';

final routerProvider = Provider<GoRouter>((ref) {
  final router = ref.watch(routerNotifierProvider.notifier);
  return GoRouter(
    navigatorKey: rootNavigatorKey,
    debugLogDiagnostics: true,
    initialLocation: const SplashRoute().location,
    routes: $appRoutes,
    refreshListenable: router,
    redirect: router.redirect,
  );
});

final routerNotifierProvider = AsyncNotifierProvider<RouterNotifierProvider, void>(
  () => RouterNotifierProvider(),
);

class RouterNotifierProvider extends AsyncNotifier<void> implements Listenable {
  RouterNotifierProvider() : super();
  VoidCallback? _routerListener;
  ErrorStatus _currentErrorStatus = NoneError(AuthStates.unknown);
  ErrorStatus? _prevErrorStatus;
  List<String> _path = ['', const SplashRoute().location];
  @override
  FutureOr<void> build() async {
    _currentErrorStatus = await ref.watch(
      appStatusAsyncNotifierProvider.selectAsync((data) => data),
    );

    ref.listenSelf((previous, next) {
      if (previous == next) return;
      _routerListener?.call();
    });
  }

  String previous() {
    return _path.first;
  }

  FutureOr<String?> redirect(BuildContext context, GoRouterState goState) async {
    if (goState.location == '') {
      _path = [const SplashRoute().location];
    }
    if (goState.location != _path.last) {
      _path = [_path.last, goState.location];
    }

    switch (_currentErrorStatus) {
      case ComponentsCheckMode():
      case NetworkDisconnected():
      case UpdateRequired():
      case StorageCapacityInsufficient():
        return _currentErrorStatus.location;
      case NoneError():
        switch ((_currentErrorStatus as NoneError).states) {
          case AuthStates.authenticated:
            return const QuestionRoute().location;
          case AuthStates.unauthenticated:
          case AuthStates.unknown:
            return const LoginRoute().location;
        }
    }
  }

  @override
  void addListener(VoidCallback listener) {
    _routerListener = listener;
  }

  @override
  void removeListener(VoidCallback listener) {
    _routerListener = null;
  }
}
