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
        return macos;
      case TargetPlatform.windows:
        return windows;
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
    apiKey: 'AIzaSyD6M0CLdXo0EwzhNP6UcYLRXehL3PnhTr8',
    appId: '1:706364280867:web:1bef27c434b8540dba6196',
    messagingSenderId: '706364280867',
    projectId: 'holbegram-c1e72',
    authDomain: 'holbegram-c1e72.firebaseapp.com',
    storageBucket: 'holbegram-c1e72.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAsqAWh7PpiOMJ4oYPz8pVNJRmyLqctQfw',
    appId: '1:706364280867:android:d79e0bd6b3dbf7b2ba6196',
    messagingSenderId: '706364280867',
    projectId: 'holbegram-c1e72',
    storageBucket: 'holbegram-c1e72.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDpWMPIhE_nzAatNG6_9LW_FGfsjHFvn-A',
    appId: '1:706364280867:ios:aaeb1721caa3c298ba6196',
    messagingSenderId: '706364280867',
    projectId: 'holbegram-c1e72',
    storageBucket: 'holbegram-c1e72.appspot.com',
    iosBundleId: 'com.example.holbegram',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDpWMPIhE_nzAatNG6_9LW_FGfsjHFvn-A',
    appId: '1:706364280867:ios:aaeb1721caa3c298ba6196',
    messagingSenderId: '706364280867',
    projectId: 'holbegram-c1e72',
    storageBucket: 'holbegram-c1e72.appspot.com',
    iosBundleId: 'com.example.holbegram',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyD6M0CLdXo0EwzhNP6UcYLRXehL3PnhTr8',
    appId: '1:706364280867:web:9f738f2a0f7a377eba6196',
    messagingSenderId: '706364280867',
    projectId: 'holbegram-c1e72',
    authDomain: 'holbegram-c1e72.firebaseapp.com',
    storageBucket: 'holbegram-c1e72.appspot.com',
  );

}