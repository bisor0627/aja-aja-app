import 'dart:async';

import 'package:aja_aja_app/flavors.dart';
import 'package:aja_aja_app/theme/app/theme_app.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';

import 'app.dart';

FutureOr<void> main() async {
  if (F.appFlavor == Flavor.theme) {
    runApp(const ProviderScope(child: ThemeApp()));
  } else {
    runApp(const ProviderScope(child: App()));
  }
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

  // svg 캐시 저장
  svgPrecacheImage();
}

/// svg 아이콘 이미지 캐싱
void svgPrecacheImage() {
  const svgImages = [];

  for (String element in svgImages) {
    var loader = SvgAssetLoader(element);
    svg.cache.putIfAbsent(loader.cacheKey(null), () => loader.loadBytes(null));
  }
}
