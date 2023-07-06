import '../index.dart';

final localRepositoryProvider = ChangeNotifierProvider<LocalRepository>((ref) {
  return LocalRepository(ref);
});

class LocalRepository extends ChangeNotifier {
  final Ref ref;

  LocalRepository(this.ref);

  /// 최초 실행 여부 불러오기
  bool getIsFirstStart() {
    var isFirstStart = ref.read(sharedPreferencesProvider).getBool(SharedPreferencesKey.isFirstStart.name) ?? true;
    return isFirstStart;
  }

  /// 최초 실행 여부 저장하기
  void setIsFirstStart() {
    ref.read(sharedPreferencesProvider).setBool(SharedPreferencesKey.isFirstStart.name, false);
  }

  /// 토큰정보 불러오기
  String? getAccessToken() {
    var accessToken = ref.read(sharedPreferencesProvider).getString(SharedPreferencesKey.accessToken.name);
    return accessToken;
  }

  /// 토큰정보 저장
  void setAccessToken(String token) {
    ref.read(sharedPreferencesProvider).setString(SharedPreferencesKey.accessToken.name, token);
    notifyListeners();
  }

  /// 토큰정보 초기화
  void clearAccessToken() {
    ref.read(sharedPreferencesProvider).remove(SharedPreferencesKey.accessToken.name);
  }

  /// 리프레시 토큰정보 불러오기
  String? getRefreshToken() {
    var refreshToken = ref.read(sharedPreferencesProvider).getString(SharedPreferencesKey.refreshToken.name);
    return refreshToken;
  }

  /// 리프레시 토큰정보 저장
  void setRefreshToken(String token) {
    ref.read(sharedPreferencesProvider).setString(SharedPreferencesKey.refreshToken.name, token);
  }

  /// 리프레시 토큰정보 초기화
  void clearRefreshToken() {
    ref.read(sharedPreferencesProvider).remove(SharedPreferencesKey.refreshToken.name);
  }

  /// 아이디저장 체크 여부 불러오기
  bool getCheckSaveId() {
    var checkSaveId = ref.read(sharedPreferencesProvider).getBool(SharedPreferencesKey.checkSaveId.name) ?? false;
    return checkSaveId;
  }

  /// 아이디저장 체크 여부 저장
  void setCheckSaveId(bool checkSaveId) {
    ref.read(sharedPreferencesProvider).setBool(SharedPreferencesKey.checkSaveId.name, checkSaveId);
  }

  /// 로그인 아이디(email) 불러오기
  String getLoginEmail() {
    var loginEmail = ref.read(sharedPreferencesProvider).getString(SharedPreferencesKey.loginEmail.name) ?? '';
    return loginEmail;
  }

  /// 로그인 아이디(email) 저장
  void setLoginEmail(String email) {
    ref.read(sharedPreferencesProvider).setString(SharedPreferencesKey.loginEmail.name, email);
  }

  /// 로그인 아이디(email) 삭제
  void clearLoginEmail() {
    ref.read(sharedPreferencesProvider).remove(SharedPreferencesKey.loginEmail.name);
  }
}
