import '../../../index.dart';

_Path path = _Path();

_AuthStateTracker authStateTracker = _AuthStateTracker();

class _Path {
  final List<String> _stack = [];

  void push(String item) {
    if (item == const SplashRoute().location || item.isEmpty) {
      return; // item이 스플래쉬 페이지 라우트거나 빈 문자열일 경우 추가하지 않고 종료
    }
    if (_stack.isNotEmpty && _stack.last == item) {
      return; // 스택에 아이템이 있고, 새로 추가되는 아이템이 스택의 마지막 아이템과 같을 경우 추가하지 않고 종료
    }
    if (_stack.length >= 2) {
      _stack.removeAt(0); // 스택에 이미 두 개의 요소가 있는 경우 가장 오래된 요소를 제거
    }
    _stack.add(item); // 새로운 항목을 스택에 추가
  }

  /// 스택의 맨 위의 항목을 제거하고 반환
  String pop() {
    return _stack.isNotEmpty ? _stack.removeLast() : _ifEmpty;
  }

  /// 스택의 맨 위의 항목을 반환하지만 제거하지는 않음
  String get first => _stack.isNotEmpty ? _stack.first : _ifEmpty;

  String get _ifEmpty => const SplashRoute().location;
}

class _AuthStateTracker {
  final List<AuthStates> _stack = [];

  void push(AuthStates item) {
    if (_stack.length >= 2) {
      _stack.removeAt(0); // 스택에 이미 두 개의 요소가 있는 경우 가장 오래된 요소를 제거
    }
    _stack.add(item); // 새로운 항목을 스택에 추가
  }

  bool get sameState => _stack.length >= 2 && _stack.first == _stack.last;
  bool get isAuth => _stack.isNotEmpty && _stack.last == AuthStates.authenticated;
}

ErrorStatus _prevErrorStatus = NoneError();
final routerProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    navigatorKey: rootNavigatorKey,
    debugLogDiagnostics: true,
    initialLocation: const SplashRoute().location,
    routes: $appRoutes,
    redirect: (context, state) async {
      path.push(state.location);

      if (state.location == '/') {
        return const SplashRoute().location;
      }

      await ref.watch(appStatusAsyncNotifierProvider.selectAsync((data) {
        switch (data) {
          case NetworkDisconnected():
          case UpdateRequired():
          case StorageCapacityInsufficient():
            _prevErrorStatus = data;
            return data.routeLocation;
          case NoneError() when _prevErrorStatus is! NoneError:
            _prevErrorStatus = NoneError();
            return path.first;
          default:
            break;
        }
      }));
      final authState = await ref.watch(authAsyncNotifierProvider.selectAsync((data) => data));
      authStateTracker.push(authState);
      if (authStateTracker.sameState) return null;
      final isSplash = state.location == const SplashRoute().location;
      if (isSplash) {
        return authStateTracker.isAuth ? const QuestionRoute().location : const LoginRoute().location;
      }

      final isLoggingIn = state.location == const LoginRoute().location;
      if (isLoggingIn) return authStateTracker.isAuth ? const QuestionRoute().location : null;

      return authStateTracker.isAuth ? null : const SplashRoute().location;
    },
  );
});
