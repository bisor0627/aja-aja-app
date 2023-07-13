enum Labels {
  incorrect_email_format('이메일 형식에 맞지 않습니다.'),
  incorrect_password_format('비밀번호 영문+숫자+기호 조합으로 8자 이상 입력해 주세요.'),
  password_not_match('패스워드가 일치하지 않습니다.');

  const Labels(this.text);

  final String text;
}
