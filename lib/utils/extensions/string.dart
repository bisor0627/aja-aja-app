import '../regexp.dart';

extension StringExtension on String? {
  /// 패스워드 확인
  bool get isPassword {
    if (this == null) return false;
    return RegExp(RegExpCheckPASSWORD).hasMatch(this!);
  }

  /// 이메일 확인
  bool get isEmail {
    if (this == null) return false;
    return RegExp(RegExpEMAIL).hasMatch(this!);
  }

  /// URL 확인
  bool get isUrl {
    if (this == null) return false;
    return RegExp(RegExpURL).hasMatch(this!);
  }

  /// 완전한 한국어 확인
  bool get isIncompleteKorean {
    if (this == null) return false;
    return RegExp(RegExpINCOMPLETE_KOREAN).hasMatch(this!);
  }
}
