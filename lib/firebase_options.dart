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
    apiKey: 'AIzaSyC1Amohfmjf6VUWEoep-PZSKyKL53dRTmI',
    appId: '1:710277594598:web:c3a83f3b898eea7c342a27',
    messagingSenderId: '710277594598',
    projectId: 'ridesync-d7861',
    authDomain: 'ridesync-d7861.firebaseapp.com',
    storageBucket: 'ridesync-d7861.appspot.com',
    measurementId: 'G-Q5FXHHQCCC',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBVCZhDJgLLRQUDsUNW2UrTNZyclXqJYeY',
    appId: '1:710277594598:android:719f2e33c86757df342a27',
    messagingSenderId: '710277594598',
    projectId: 'ridesync-d7861',
    storageBucket: 'ridesync-d7861.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBJ5xmf3_60gUvUTuDO6a0-J2KucHTuxnk',
    appId: '1:710277594598:ios:f489686d454fc768342a27',
    messagingSenderId: '710277594598',
    projectId: 'ridesync-d7861',
    storageBucket: 'ridesync-d7861.appspot.com',
    iosBundleId: 'com.example.rideSync',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyC1Amohfmjf6VUWEoep-PZSKyKL53dRTmI',
    appId: '1:710277594598:web:38d8ba1e2b975a79342a27',
    messagingSenderId: '710277594598',
    projectId: 'ridesync-d7861',
    authDomain: 'ridesync-d7861.firebaseapp.com',
    storageBucket: 'ridesync-d7861.appspot.com',
    measurementId: 'G-W1QZM2HM79',
  );
}