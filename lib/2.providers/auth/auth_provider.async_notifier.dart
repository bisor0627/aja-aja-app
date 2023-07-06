import 'dart:async';

import 'package:shared_preferences/shared_preferences.dart';

import '../../index.dart';

final authAsyncNotifierProvider = AsyncNotifierProvider<AuthAsyncNotifier, AuthStates>(() => AuthAsyncNotifier());
final networkRoundTripTime = 750.milliseconds;

extension NumDurationExtensions on num {
  Duration get microseconds => Duration(microseconds: round());
  Duration get ms => (this * 1000).microseconds;
  Duration get milliseconds => (this * 1000).microseconds;
  Duration get seconds => (this * 1000 * 1000).microseconds;
  Duration get minutes => (this * 1000 * 1000 * 60).microseconds;
  Duration get hours => (this * 1000 * 1000 * 60 * 60).microseconds;
  Duration get days => (this * 1000 * 1000 * 60 * 60 * 24).microseconds;
}

class AuthAsyncNotifier extends AsyncNotifier<AuthStates> {
  late SharedPreferences _sharedPreferences;
  static const _sharedPrefsKey = 'token';

  @override
  Future<AuthStates> build() async {
    _sharedPreferences = await SharedPreferences.getInstance();
    _persistenceRefreshLogic();
    return _loginRecoveryAttempt();
  }

  Future<void> signIn(String newUserName) async {
    state = const AsyncValue.loading();
    await Future<void>.delayed(const Duration(seconds: 3));
    state = const AsyncValue.data(AuthStates.authenticated);
  }

  Future<void> signOut() async {
    state = const AsyncValue.loading();
    await Future<void>.delayed(const Duration(seconds: 3));
    state = const AsyncValue.data(AuthStates.unAuthenticated);
  }

  Future<AuthStates> _loginRecoveryAttempt() async {
    try {
      final savedToken = _sharedPreferences.getString(_sharedPrefsKey);
      if (savedToken == null) {
        return AuthStates.unAuthenticated;
      } else {
        return AuthStates.authenticated;
      }
    } catch (_, __) {
      await _sharedPreferences.remove(_sharedPrefsKey);
      return AuthStates.unAuthenticated;
    }
  }

  void _persistenceRefreshLogic() {
    ref.listenSelf((_, next) {
      if (next.isLoading) return;
      if (next.hasError) {
        _sharedPreferences.remove(_sharedPrefsKey);
        return;
      }
    });
  }
}
