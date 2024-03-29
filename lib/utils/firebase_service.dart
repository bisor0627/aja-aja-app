//----------------------------------------------------------------------

import 'package:ajaaja_app/firebase_options.dart' as prod;
import 'package:ajaaja_app/firebase_options.dev.dart' as dev;
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

import '../flavors.dart';
import '../index.dart';

/// 3-3.앱이 켜져있는 상태에서 알림 클릭 시 이벤트(localNotification o)
@pragma('vm:entry-point')
void _onDidReceiveNotificationResponse(NotificationResponse notificationResponse) {
  loggerNoStack.i('onDidReceiveNotificationResponse');
}

/// 3-4.앱이 꺼져있는 상태에서 알림 클릭 시 이벤트(localNotification o)
@pragma('vm:entry-point')
void _onDidReceiveBackgroundNotificationResponse(NotificationResponse notificationResponse) {
  loggerNoStack.i('onDidReceiveBackgroundNotificationResponse');
}

//----------------------------------------------------------------------

/// 포그라운드 상태에서 수신
Future<void> _forgroundFCMHandler(RemoteMessage message) async {
  _firebaseMessagingHandler('forground', message);
}

/// 백그라운드 상태에서 수신
Future<void> _backgroundFCMHandler(RemoteMessage message) async {
  if (message.data.isNotEmpty) {
    _firebaseMessagingHandler('background', message);
  }
}

/// FCM 수신시 데이터 처리
void _firebaseMessagingHandler(String data, RemoteMessage message) {
  loggerNoStack.i('FCM 수신 $data message : ${message.data}');
  showNotification(message);
}

//----------------------------------------------------------------------

/// firebase 관리 서비스
class FirebaseService {
  static final FirebaseService _instance = FirebaseService._internal();

  static final _firebaseMessaging = FirebaseMessaging.instance;

  static final analytics = FirebaseAnalytics.instance;

  factory FirebaseService() {
    return _instance;
  }

  FirebaseService._internal();

  Future<void> initialize() async {
    if (Platform.isMacOS || Platform.isWindows || Platform.isLinux) {
      return;
    }

    //-----------------------------------------------------------------------------

    // 1-1.firebase initialize
    await Firebase.initializeApp(
      options: F.appFlavor == Flavor.dev
          ? prod.DefaultFirebaseOptions.currentPlatform
          : dev.DefaultFirebaseOptions.currentPlatform,
    );

    // 1-2.request permission
    await firebaseMessageRequestPermission();

    // 1-3.init localNotification(add onClick Event)
    await localNotificationInit();

    //-----------------------------------------------------------------------------

    // 2-1.앱이 포그라운드에 있을 때 수신
    FirebaseMessaging.onMessage.listen(_forgroundFCMHandler);

    // 2-2.앱이 백그라운드에 있을 때 수신
    FirebaseMessaging.onBackgroundMessage(_backgroundFCMHandler);

    //-----------------------------------------------------------------------------

    // 3-1.앱이 켜져있는 상태에서 알림 클릭 시 이벤트(localNotification x)
    FirebaseMessaging.onMessageOpenedApp.listen((message) {
      loggerNoStack.i('FCM Click(FirebaseMessaging.onMessageOpenedApp.listen)');
    });

    // 3-2.앱이 꺼져있는 상태에서 알림 클릭 시 이벤트(localNotification x)
    FirebaseMessaging.instance.getInitialMessage().then((message) {
      loggerNoStack.i('FCM Click(FirebaseMessaging.instance.getInitialMessage())');
    });

    //-----------------------------------------------------------------------------
  }

  Future<void> getInitialMessaging() async {
    RemoteMessage? message = await _firebaseMessaging.getInitialMessage();
    if (message?.data != null) {
      loggerNoStack.i('getInitialMessaging');
      loggerNoStack.i(message?.data);
    }
  }

  Future<void> firebaseMessageRequestPermission() async {
    await _firebaseMessaging.requestPermission(sound: true, badge: true, alert: true);
  }

  Future<void> localNotificationInit() async {
    const AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings('@mipmap/ic_launcher');

    var initializationSettingsIOS = const DarwinInitializationSettings(
      requestAlertPermission: true,
      requestBadgePermission: true,
      requestSoundPermission: true,
    );

    InitializationSettings initializationsSettings = InitializationSettings(
      android: initializationSettingsAndroid,
      iOS: initializationSettingsIOS,
    );

    // android 13이상에서 권한 요청
    flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<AndroidFlutterLocalNotificationsPlugin>()
        ?.requestPermission();

    await flutterLocalNotificationsPlugin.initialize(
      initializationsSettings,
      onDidReceiveNotificationResponse: _onDidReceiveNotificationResponse,
      onDidReceiveBackgroundNotificationResponse: _onDidReceiveBackgroundNotificationResponse,
    );
  }

  // PUSH를 보내기위해 식별할 수 있는 토큰 추출 (JWT 인증 토큰 아님)
  Future<String> getToken() async {
    if (Platform.isAndroid || Platform.isIOS) {
      var token = await _firebaseMessaging.getToken();

      if (token == null) {
        throw Exception("can not get fcm token");
      }

      return token;
    } else {
      return Future.value("this_is_desktop_firebase_token");
    }
  }

  /// 로그인 시 연결
  void subscribe() {
    if (Platform.isIOS) {
      _firebaseMessaging.subscribeToTopic('ios-all');
    }
    if (Platform.isAndroid) {
      _firebaseMessaging.subscribeToTopic('android-all');
    }
  }

  /// 로그인 시 연결해제
  Future<void> unsubscribe() async {
    if (Platform.isMacOS || Platform.isWindows || Platform.isLinux) {
      return;
    }
    await _firebaseMessaging.deleteToken();
    if (Platform.isIOS) {
      _firebaseMessaging.unsubscribeFromTopic('ios-all');
    }
    if (Platform.isAndroid) {
      _firebaseMessaging.unsubscribeFromTopic('android-all');
    }
  }
}

// foreground일 때 push 알림을 보내기위한 FlutterLocalNotificationsPlugin 이하 FLN
final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

// FLN Push 알림
Future<void> showNotification(RemoteMessage message) async {
  String title = message.data["title"] ?? '제목';
  String body = message.data["body"] ?? '내용';
  String? messageKey;

  AndroidNotificationDetails androidPlatformChannelSpecifics = AndroidNotificationDetails(
    'id_fcm_channel',
    'fcm_channel',
    channelDescription: 'fcm_channel_description...',
    importance: Importance.max,
    priority: Priority.high,
    ticker: 'ticker',
    tag: messageKey, //키 값
  );
  NotificationDetails platformChannelSpecifics = NotificationDetails(android: androidPlatformChannelSpecifics);
  await flutterLocalNotificationsPlugin.show(0, title, body, platformChannelSpecifics, payload: messageKey);
}
