import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';

import '../../index.dart';

final appStatusAsyncNotifierProvider =
    AsyncNotifierProvider<AppStatusAsyncNotifier, ErrorStatus>(() => AppStatusAsyncNotifier());

class AppStatusAsyncNotifier extends AsyncNotifier<ErrorStatus> {
  AppStatusAsyncNotifier() : super() {
    _connectivity.onConnectivityChanged.listen(_updateConnectionStatus);
  }

  final Connectivity _connectivity = Connectivity();

  @override
  FutureOr<ErrorStatus> build() async {
    return NoneError();
  }

  Future<void> _updateConnectionStatus(ConnectivityResult result) async {
    if (result == ConnectivityResult.none) {
      state = AsyncValue.data(NetworkDisconnected());
    } else {
      state = AsyncValue.data(NoneError());
    }
  }

  Future<void> componentsCheck() async {
    state = const AsyncLoading();
    if (state.valueOrNull is ComponentsCheckMode) {
      state = AsyncValue.data(NoneError());
    } else {
      state = AsyncValue.data(ComponentsCheckMode());
    }
  }
}
