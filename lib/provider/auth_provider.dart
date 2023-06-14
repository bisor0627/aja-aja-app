import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// StreamAuth를 관리하는 Provider를 생성
final streamAuthProvider =
    ChangeNotifierProvider<StreamAuth>((ref) => StreamAuth());

class StreamAuth with ChangeNotifier {
  String? _currentUser;
  final _userStreamController = StreamController<String?>.broadcast();
  int refreshInterval = 20;
  Timer? _timer;

  StreamAuth() {
    _userStreamController.stream.listen((String? currentUser) {
      _currentUser = currentUser;
      notifyListeners();
    });
  }

  String? get currentUser => _currentUser;

  Stream<String?> get onCurrentUserChanged => _userStreamController.stream;
  Future<bool> isSignedIn() async {
    await Future<void>.delayed(const Duration(seconds: 1));
    return _currentUser != null;
  }

  Timer _createRefreshTimer() {
    return Timer(Duration(seconds: refreshInterval), () {
      _userStreamController.add(null);
      _timer = null;
    });
  }

  Future<void> signIn(String newUserName) async {
    await Future<void>.delayed(const Duration(seconds: 3));
    _userStreamController.add(newUserName);
    _timer?.cancel();
    _timer = _createRefreshTimer();
  }

  Future<void> signOut() async {
    _timer?.cancel();
    _timer = null;
    _userStreamController.add(null);
  }
}
