// ignore_for_file: constant_identifier_names

/// 이메일 정규식
const RegExpEMAIL =
    r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

/// URL 정규식
const RegExpURL = r"[-a-zA-Z0-9@:%._\+~#=]{1,256}\.[a-zA-Z0-9]{2,6}(\/[-a-zA-Z0-9()@:%_\+.~#?&\/=]*)?";

/// 한글 정규식
const RegExpKOREAN = r'[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]';

/// 한글 자음 모음 정규식
const RegExpINCOMPLETE_KOREAN = r'[ㄱ-ㅎ|ㅏ-ㅣ]';

/// 이름
const RegExpNAME = r'[a-z|A-Z|ㄱ-ㅎ|ㅏ-ㅣ|가-힣|ᆞ|ᆢ|ㆍ|ᆢ|ᄀᆞ|ᄂᆞ|ᄃᆞ|ᄅᆞ|ᄆᆞ|ᄇᆞ|ᄉᆞ|ᄋᆞ|ᄌᆞ|ᄎᆞ|ᄏᆞ|ᄐᆞ|ᄑᆞ|ᄒᆞ]';

/// 패스워드 검증 (영문 + 숫자 + 특수문자이면서 8글자 이상 18글자 이하) 정규식
const RegExpPASSWORD = r'''^(?=.*[a-zA-Z])(?=.*\d)(?=.*[\{\}\[\]\/?.,;:|)*~`!^\-_+<>@\\#$%&\\\=\("']).{8,}$''';
