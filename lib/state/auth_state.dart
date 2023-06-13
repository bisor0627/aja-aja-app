import 'dart:math';

// 현재 로그인 상태를 반환하는 함수입니다.
final bool _loggedIn = Random().nextBool();
// 현재 로그인 상태를 반환하는 함수입니다.
Future<bool> isSignedIn() async {
  return _loggedIn;
}
