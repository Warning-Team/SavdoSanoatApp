// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
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
    apiKey: 'AIzaSyCCkkwwMXXeQPp55lF65vV9Vot8eH8AQBo',
    appId: '1:328587649727:web:2fdc4875a66dcc04e61c0a',
    messagingSenderId: '328587649727',
    projectId: 'savdosanoatapp',
    authDomain: 'savdosanoatapp.firebaseapp.com',
    databaseURL: 'https://savdosanoatapp-default-rtdb.firebaseio.com',
    storageBucket: 'savdosanoatapp.appspot.com',
    measurementId: 'G-V8PM64RLET',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBpeueSb6yG_0W4f0jiEKg-clbWmRuoy9E',
    appId: '1:328587649727:android:f60b5161e006ac82e61c0a',
    messagingSenderId: '328587649727',
    projectId: 'savdosanoatapp',
    databaseURL: 'https://savdosanoatapp-default-rtdb.firebaseio.com',
    storageBucket: 'savdosanoatapp.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCSylFOowRx_rZZWPGNA6NH4-Rp7Jt0axg',
    appId: '1:328587649727:ios:cf9c1d000f7e8005e61c0a',
    messagingSenderId: '328587649727',
    projectId: 'savdosanoatapp',
    databaseURL: 'https://savdosanoatapp-default-rtdb.firebaseio.com',
    storageBucket: 'savdosanoatapp.appspot.com',
    iosBundleId: 'com.example.savdosanoatapp',
  );
}