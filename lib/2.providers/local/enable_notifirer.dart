import 'package:ajaaja_app/index.dart';

class LocalEnableNotifier extends StateNotifier<bool> {
  LocalEnableNotifier() : super(false);

  void checkEnable(bool isValidate) {
    state = isValidate;
  }
}
