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
    apiKey: 'AIzaSyAxqlsqCG_WYnVGv0ryCGShyIggCCHJbKk',
    appId: '1:781612852839:web:192ceded1610a2402116c2',
    messagingSenderId: '781612852839',
    projectId: 'hoper-d43fb',
    authDomain: 'hoper-d43fb.firebaseapp.com',
    storageBucket: 'hoper-d43fb.appspot.com',
    measurementId: 'G-1DHR3KCBFG',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyC3_1-RZi5wul1avnsJ9eZ9LxkPRuy5J7Y',
    appId: '1:781612852839:android:8d439f5cc9c51d522116c2',
    messagingSenderId: '781612852839',
    projectId: 'hoper-d43fb',
    storageBucket: 'hoper-d43fb.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCvvVl0Oe9Z1xcO8QAW6KzCohib2W2n_eo',
    appId: '1:781612852839:ios:3868aff2ba61288d2116c2',
    messagingSenderId: '781612852839',
    projectId: 'hoper-d43fb',
    storageBucket: 'hoper-d43fb.appspot.com',
    iosBundleId: 'com.example.hoper',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCvvVl0Oe9Z1xcO8QAW6KzCohib2W2n_eo',
    appId: '1:781612852839:ios:1e867382136423a92116c2',
    messagingSenderId: '781612852839',
    projectId: 'hoper-d43fb',
    storageBucket: 'hoper-d43fb.appspot.com',
    iosBundleId: 'com.example.hoper.RunnerTests',
  );
}
