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
    apiKey: 'AIzaSyBiGIKqIzhe-5E8446LSSJyAeSEWhBpBGs',
    appId: '1:328371012229:web:c9497d5349863373e45fec',
    messagingSenderId: '328371012229',
    projectId: 'news-app-529f3',
    authDomain: 'news-app-529f3.firebaseapp.com',
    storageBucket: 'news-app-529f3.firebasestorage.app',
    measurementId: 'G-R52X8G2J6W',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyApKcPAzhSqZ4N3vtRKrQ2KTQmC4veY7qc',
    appId: '1:328371012229:android:e94f00e68be3164ae45fec',
    messagingSenderId: '328371012229',
    projectId: 'news-app-529f3',
    storageBucket: 'news-app-529f3.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBgJY3omoI2b0JQbZwHiEfjEB_fuxfpDig',
    appId: '1:328371012229:ios:bca25a7e9f748af7e45fec',
    messagingSenderId: '328371012229',
    projectId: 'news-app-529f3',
    storageBucket: 'news-app-529f3.firebasestorage.app',
    iosBundleId: 'com.example.wetherAppV1',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBgJY3omoI2b0JQbZwHiEfjEB_fuxfpDig',
    appId: '1:328371012229:ios:bca25a7e9f748af7e45fec',
    messagingSenderId: '328371012229',
    projectId: 'news-app-529f3',
    storageBucket: 'news-app-529f3.firebasestorage.app',
    iosBundleId: 'com.example.wetherAppV1',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyBiGIKqIzhe-5E8446LSSJyAeSEWhBpBGs',
    appId: '1:328371012229:web:a9fc99fc16507306e45fec',
    messagingSenderId: '328371012229',
    projectId: 'news-app-529f3',
    authDomain: 'news-app-529f3.firebaseapp.com',
    storageBucket: 'news-app-529f3.firebasestorage.app',
    measurementId: 'G-354BGPJH5J',
  );
}
