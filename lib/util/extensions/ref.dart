import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';

final _debounceFuture = <Ref, Completer<void>>{};
final _debounceTimer = <Ref, Timer>{};

extension RefExtension on Ref {
  Future<void> debounce(Duration duration) {
    
    // 기존 데이터 제거
    if (_debounceFuture.containsKey(this)) {
      _debounceTimer[this]!.cancel();
      final completer = _debounceFuture[this]!;
      if (completer.isCompleted == false) {
        _debounceFuture[this]!.completeError(StateError('cancelled'));
      }
    }

    // 컴플리터 선언
    _debounceFuture[this] = Completer<void>();

    // 타이머 선언
    _debounceTimer[this] = Timer(
      duration,
      () {
        // 타이머 완료 시
        final completer = _debounceFuture[this]!;
        if (!completer.isCompleted) {
          completer.complete();
        }
      },
    );

    return _debounceFuture[this]!.future;
  }
}