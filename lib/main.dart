import 'dart:async';

import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'app.dart';
import 'index.dart';

FutureOr<void> main() async {
  await platformSetup();
  // 내부 스토리지 생성
  var prefs = await SharedPreferences.getInstance();

  runApp(
    ProviderScope(
      observers: [
        RiverpodObserver(),
      ],
      overrides: [
        sharedPreferencesProvider.overrideWithValue(prefs),
      ],
      child: const App(),
    ),
  );
}

/// 플러터 환경설정 세팅
Future<void> platformSetup() async {
  // Flutter 엔진과 위젯의 바인딩 작업
  WidgetsFlutterBinding.ensureInitialized();

  // 가로모드 제어
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  // 다국어 기본 한국어로 적용
  Intl.defaultLocale = 'ko_KR';

  // Firebase 초기화
  await FirebaseService().initialize();

  // svg 캐시 저장
  svgPreCacheImage();
}

/// svg 아이콘 이미지 캐싱
void svgPreCacheImage() {
  const svgImages = [];

  for (String element in svgImages) {
    var loader = SvgAssetLoader(element);
    svg.cache.putIfAbsent(loader.cacheKey(null), () => loader.loadBytes(null));
  }
}
