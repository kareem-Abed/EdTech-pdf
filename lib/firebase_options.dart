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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for ios - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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
    apiKey: 'AIzaSyBcBUQ0kVCv9zjTVU_ReqpANAIqOwYMCi8',
    appId: '1:832397551573:web:f125d31dc0ef62a6b2ff5c',
    messagingSenderId: '832397551573',
    projectId: 'svupdf-15c4c',
    authDomain: 'svupdf-15c4c.firebaseapp.com',
    databaseURL: 'https://svupdf-15c4c-default-rtdb.firebaseio.com',
    storageBucket: 'svupdf-15c4c.appspot.com',
    measurementId: 'G-LJYC1S5356',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDrFZFUgY0LXqHwAIUejs5bZQT4pluHFgo',
    appId: '1:832397551573:android:c2eafd0851b1ad2db2ff5c',
    messagingSenderId: '832397551573',
    projectId: 'svupdf-15c4c',
    databaseURL: 'https://svupdf-15c4c-default-rtdb.firebaseio.com',
    storageBucket: 'svupdf-15c4c.appspot.com',
  );
}