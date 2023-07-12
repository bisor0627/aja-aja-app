import 'package:ajaaja_app/index.dart';

class LocalTextEditNotifier extends StateNotifier<String> {
  LocalTextEditNotifier() : super(''); // 초기 상태를 빈 문자열로 설정합니다.

  // 텍스트를 변경하는 메서드입니다.
  void setText(String text) {
    state = text;
  }
}
