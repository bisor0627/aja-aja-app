import 'dart:async';

import 'package:aja_aja_app/util/enums.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final authAsyncNotifierProvider = AsyncNotifierProvider<AuthAsyncNotifier, AuthStates>(() => AuthAsyncNotifier());

class AuthAsyncNotifier extends AsyncNotifier<AuthStates> {
  AuthAsyncNotifier() : super() {
    AuthStates.unknown;
  }

  @override
  FutureOr<AuthStates> build() async {
    await Future.delayed(const Duration(seconds: 3));

    return AuthStates.unauthenticated;
  }

  Future<void> signIn(String newUserName) async {
    state = const AsyncValue.loading();
    await Future<void>.delayed(const Duration(seconds: 3));
    state = const AsyncValue.data(AuthStates.authenticated);
  }

  Future<void> signOut() async {
    state = const AsyncValue.loading();
    await Future<void>.delayed(const Duration(seconds: 3));
    state = const AsyncValue.data(AuthStates.unauthenticated);
  }
}
