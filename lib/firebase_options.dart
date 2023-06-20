// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyCRfSRmdAuUGo-BjaBXpcA6gEywuCe0tv4',
    appId: '1:508266637437:web:8440a9ca32d6baaa22e914',
    messagingSenderId: '508266637437',
    projectId: 'aja-aja-app',
    authDomain: 'aja-aja-app.firebaseapp.com',
    storageBucket: 'aja-aja-app.appspot.com',
    measurementId: 'G-0WJJJBQ5F2',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyASNCKhxIR6HAmutkm1Jy1ZPhetoYc0Hjc',
    appId: '1:508266637437:android:df15027a421a56e922e914',
    messagingSenderId: '508266637437',
    projectId: 'aja-aja-app',
    storageBucket: 'aja-aja-app.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCbdKxMSQYZzVrO8ikkMnNNgdYC71Bizok',
    appId: '1:508266637437:ios:c1aca7e5dd320e9022e914',
    messagingSenderId: '508266637437',
    projectId: 'aja-aja-app',
    storageBucket: 'aja-aja-app.appspot.com',
    iosClientId: '508266637437-32vn91pv3a9drchd8roffs1sfm4ko13g.apps.googleusercontent.com',
    iosBundleId: 'com.a.ja.a.ja.app.theme',
  );
}
