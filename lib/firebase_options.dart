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
        return macos;
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
    apiKey: 'AIzaSyBE8Q0A9fqdta_xeZC1Y00J5qI9A21Cj04',
    appId: '1:911777939876:web:93e5e3de8c107a0dcd4131',
    messagingSenderId: '911777939876',
    projectId: 'hands2gether-c49c0',
    authDomain: 'hands2gether-c49c0.firebaseapp.com',
    databaseURL: 'https://hands2gether-c49c0-default-rtdb.firebaseio.com',
    storageBucket: 'hands2gether-c49c0.appspot.com',
    measurementId: 'G-WDC5JW4FQ1',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyB0DrW0g_DsdLde0iabl9h_xfXw5MJhdPw',
    appId: '1:911777939876:android:e153542b49c531c4cd4131',
    messagingSenderId: '911777939876',
    projectId: 'hands2gether-c49c0',
    databaseURL: 'https://hands2gether-c49c0-default-rtdb.firebaseio.com',
    storageBucket: 'hands2gether-c49c0.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyC26XRmabRdWD_M3McO5FMrBTAPHmCR65g',
    appId: '1:911777939876:ios:0d911416cd5aec39cd4131',
    messagingSenderId: '911777939876',
    projectId: 'hands2gether-c49c0',
    databaseURL: 'https://hands2gether-c49c0-default-rtdb.firebaseio.com',
    storageBucket: 'hands2gether-c49c0.appspot.com',
    androidClientId:
        '911777939876-58ddvglp7e04dlbgfesq1nr53j27jhpk.apps.googleusercontent.com',
    iosClientId:
        '911777939876-1opv2fkbk9k5rcqbholgg8oae6qph3ld.apps.googleusercontent.com',
    iosBundleId: 'com.hands2gether.org',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyC26XRmabRdWD_M3McO5FMrBTAPHmCR65g',
    appId: '1:911777939876:ios:0d911416cd5aec39cd4131',
    messagingSenderId: '911777939876',
    projectId: 'hands2gether-c49c0',
    databaseURL: 'https://hands2gether-c49c0-default-rtdb.firebaseio.com',
    storageBucket: 'hands2gether-c49c0.appspot.com',
    androidClientId:
        '911777939876-58ddvglp7e04dlbgfesq1nr53j27jhpk.apps.googleusercontent.com',
    iosClientId:
        '911777939876-1opv2fkbk9k5rcqbholgg8oae6qph3ld.apps.googleusercontent.com',
    iosBundleId: 'com.hands2gether.org',
  );
}