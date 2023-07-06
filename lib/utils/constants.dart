const String testImageUrl = 'https://cdn.pixabay.com/photo/2016/11/29/05/55/adult-1867665_960_720.jpg';

const String defaultUser = 'https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_1280.png';

const kDefaultCollapseHeight = 100.0;
late String deviceLanguage;

const kDefaultPadding = 16.0;
const kDefaultVerticalPadding = 8.0;
const kDefaultHorizontalPadding = 16.0;

const kDefaultPaginationCnt = 10;

const kDefaultDrawerBtnSpace = 8.0;

class Validation {
  static const emailRegex =
      r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$";

  // static const linkRegex = r'[-a-zA-Z0-9@:%._\+~#=]{1,256}\.[a-zA-Z0-9()]{1,6}\b([-a-zA-Z0-9()@:%_\+.~#?&//=]*)';
  static const linkRegex =
      r'https?:\/\/(www\.)?[-a-zA-Z0-9@:%._\+~#=]{1,256}\.[a-zA-Z0-9()]{1,6}\b([-a-zA-Z0-9()@:%_\+.~#?&//=]*)';
}
