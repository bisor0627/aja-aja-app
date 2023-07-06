import '../index.dart';

final authRepositoryProvider = Provider<AuthRepository>(AuthRepository.new);

class AuthRepository {
  final Ref ref;

  AuthRepository(this.ref);

  /// 최초 실행 여부 불러오기
  Future<DataResponse<SignInResponse>> signIn(SignInRequest request) async {
    try {
      var result = await ref.read(restApiProvider).signInEmail(request);
      return result;
    } catch (e) {
      logger.e(e);
      // showErrorLog(error: e, stackTrace: StackTrace.current);
      rethrow;
    }
  }
}
