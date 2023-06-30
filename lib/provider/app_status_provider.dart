import 'dart:async';

import 'package:aja_aja_app/provider/provider.dart';
import 'package:aja_aja_app/util/enums.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../app/pages/pages.dart';

final appStatusAsyncNotifierProvider =
    AsyncNotifierProvider<AppStatusAsyncNotifier, ErrorStatus>(() => AppStatusAsyncNotifier());

class AppStatusAsyncNotifier extends AsyncNotifier<ErrorStatus> {
  AppStatusAsyncNotifier() : super() {
    _connectivity.onConnectivityChanged.listen(_updateConnectionStatus);
  }
  AuthStates _authStatus = AuthStates.unknown;
  final Connectivity _connectivity = Connectivity();

  @override
  FutureOr<ErrorStatus> build() async {
    _authStatus = await ref.watch(
      authAsyncNotifierProvider.selectAsync(
        (data) => data,
      ),
    );
    return NoneError(_authStatus);
  }

  Future<void> _updateConnectionStatus(ConnectivityResult result) async {
    if (result == ConnectivityResult.none) {
      state = AsyncValue.data(NetworkDisconnected());
    } else {
      state = AsyncValue.data(NoneError(_authStatus));
    }
  }

  Future<void> componentsCheck() async {
    state = const AsyncLoading();
    if (state.valueOrNull is ComponentsCheckMode) {
      state = AsyncValue.data(NoneError(_authStatus));
    } else {
      state = AsyncValue.data(ComponentsCheckMode());
    }
  }
}
