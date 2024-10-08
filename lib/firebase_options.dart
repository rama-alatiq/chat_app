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
    apiKey: 'AIzaSyDKPDkYQCvN76QVA2YsdzvjGVroAAV0wsQ',
    appId: '1:943887094164:web:a96e859f42961c3ec6bf81',
    messagingSenderId: '943887094164',
    projectId: 'chat-app-f72d8',
    authDomain: 'chat-app-f72d8.firebaseapp.com',
    storageBucket: 'chat-app-f72d8.appspot.com',
    measurementId: 'G-3M8ZG4XEPW',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyC5SsuChcatYnJ7sN1D58E5cIcKb-S8eS0',
    appId: '1:943887094164:android:57b72f9656970c11c6bf81',
    messagingSenderId: '943887094164',
    projectId: 'chat-app-f72d8',
    storageBucket: 'chat-app-f72d8.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAXec0oXmpw2Y65EXWTPCSYfffiw-tPCyQ',
    appId: '1:943887094164:ios:f8b012373d3461bec6bf81',
    messagingSenderId: '943887094164',
    projectId: 'chat-app-f72d8',
    storageBucket: 'chat-app-f72d8.appspot.com',
    iosBundleId: 'com.example.chatApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAXec0oXmpw2Y65EXWTPCSYfffiw-tPCyQ',
    appId: '1:943887094164:ios:f8b012373d3461bec6bf81',
    messagingSenderId: '943887094164',
    projectId: 'chat-app-f72d8',
    storageBucket: 'chat-app-f72d8.appspot.com',
    iosBundleId: 'com.example.chatApp',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyDKPDkYQCvN76QVA2YsdzvjGVroAAV0wsQ',
    appId: '1:943887094164:web:10212350ac1e77d0c6bf81',
    messagingSenderId: '943887094164',
    projectId: 'chat-app-f72d8',
    authDomain: 'chat-app-f72d8.firebaseapp.com',
    storageBucket: 'chat-app-f72d8.appspot.com',
    measurementId: 'G-FR16MY28YH',
  );
}
