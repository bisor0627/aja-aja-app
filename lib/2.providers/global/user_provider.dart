import 'dart:async';

import '../../index.dart';

final userAsyncNotifierProvider =
    AsyncNotifierProvider<UserAsyncNotifier, DataResponse<MeResponse>>(() => UserAsyncNotifier());

class UserAsyncNotifier extends AsyncNotifier<DataResponse<MeResponse>> {
  UserAsyncNotifier() : super() {
    AuthStates.initial;
  }

  Future<DataResponse<MeResponse>> _fetchMe() async {
    var result = await ref.read(userRepositoryProvider).getMe();
    return result;
    // state = const AsyncValue.loading();

    // state = await AsyncValue.guard(() async {
    //   var result = await ref.read(userRepositoryProvider).getMe();
    //   return result;
    // });
  }

  @override
  FutureOr<DataResponse<MeResponse>> build() async {
    await Future.delayed(const Duration(seconds: 3));
    return _fetchMe();
  }

  Future<void> addUser(Map<String, dynamic> request) async {
    state = const AsyncValue.loading();

    state = await AsyncValue.guard(() async {
      await ref.read(userRepositoryProvider).addUser(request);
      return _fetchMe();
    });
  }
}
