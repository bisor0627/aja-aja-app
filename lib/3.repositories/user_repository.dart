import 'package:ajaaja_app/4.data_sources/remote/firestore_api_provider.dart';
import 'package:ajaaja_app/4.data_sources/remote/firestore_config.dart';

import '../index.dart';

final userRepositoryProvider = Provider<UserRepository>(UserRepository.new);

class UserRepository {
  final Ref ref;

  UserRepository(this.ref);

  Future<DataResponse<MeResponse>> getMe() async {
    try {
      var result = await ref.watch(firestoreApiProvider).getDocWithUserRef(FirestoreConfig.instance.userDoc);

      if (result == null) {
        return DataResponse<MeResponse>(isSuccess: false, data: []);
      }

      return DataResponse<MeResponse>(isSuccess: true, data: [result]);
    } catch (e) {
      logger.e(e);
      // showErrorLog(error: e, stackTrace: StackTrace.current);
      rethrow;
    }
  }

  Future<DataResponse<bool>> addUser(Map<String, dynamic> input) async {
    try {
      var result = await ref.watch(firestoreApiProvider).addDocument(FirestoreConfig.instance.userCollection, input);

      if (result == true) {
        return DataResponse<bool>(isSuccess: true, data: [result]);
      } else {
        return DataResponse<bool>(isSuccess: false, data: []);
      }
    } catch (e) {
      logger.e(e);
      // return DataResponse<MeResponse>(isSuccess: true, data: [result]);
      rethrow;
    }
  }
}
