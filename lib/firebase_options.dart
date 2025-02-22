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
    apiKey: 'AIzaSyA0v4Vz_-h1Cf_2fggNfcaTsiNfjQGRXFg',
    appId: '1:381270401376:web:37c9d7ff05d3c5c88dfe05',
    messagingSenderId: '381270401376',
    projectId: 'authentication-823d8',
    authDomain: 'authentication-823d8.firebaseapp.com',
    storageBucket: 'authentication-823d8.appspot.com',
    measurementId: 'G-S640TC6WZT',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBlzbggWFKGMLw0PVT_AwAM37XsF6f5G4c',
    appId: '1:381270401376:android:61614ccdf88c524c8dfe05',
    messagingSenderId: '381270401376',
    projectId: 'authentication-823d8',
    storageBucket: 'authentication-823d8.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDD0sEbzGVaNFc8in8Sb1D_YkV1bAi1TZY',
    appId: '1:381270401376:ios:e21a3bad2356f7cf8dfe05',
    messagingSenderId: '381270401376',
    projectId: 'authentication-823d8',
    storageBucket: 'authentication-823d8.appspot.com',
    iosBundleId: 'com.example.drawingApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDD0sEbzGVaNFc8in8Sb1D_YkV1bAi1TZY',
    appId: '1:381270401376:ios:e21a3bad2356f7cf8dfe05',
    messagingSenderId: '381270401376',
    projectId: 'authentication-823d8',
    storageBucket: 'authentication-823d8.appspot.com',
    iosBundleId: 'com.example.drawingApp',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyA0v4Vz_-h1Cf_2fggNfcaTsiNfjQGRXFg',
    appId: '1:381270401376:web:1ce1f0849a09421c8dfe05',
    messagingSenderId: '381270401376',
    projectId: 'authentication-823d8',
    authDomain: 'authentication-823d8.firebaseapp.com',
    storageBucket: 'authentication-823d8.appspot.com',
    measurementId: 'G-8DY4FS7WLG',
  );
}
