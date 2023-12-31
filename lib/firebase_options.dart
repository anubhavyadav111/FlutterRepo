// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members

import 'package:firebase_core/firebase_core.dart'

show FirebaseOptions;
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
    apiKey: 'AIzaSyA4lnHxvCkLV71XW37g1-ePa3nFX67E424',
    appId: '1:457484164892:web:afa223c212bf3580a2a4d9',
    messagingSenderId: '457484164892',
    projectId: 'mynotes-fd8d6',
    authDomain: 'mynotes-fd8d6.firebaseapp.com',
    storageBucket: 'mynotes-fd8d6.appspot.com',
    measurementId: 'G-2TFZ6G7SSE',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCOyamnJxrNDTNTKozGV6oGfMy6iGx1fFY',
    appId: '1:457484164892:android:352187b3ca384f6ca2a4d9',
    messagingSenderId: '457484164892',
    projectId: 'mynotes-fd8d6',
    storageBucket: 'mynotes-fd8d6.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBALmHk8Huuh87CuuijRLeInmzRu54waAw',
    appId: '1:457484164892:ios:27b515b8d27fd39fa2a4d9',
    messagingSenderId: '457484164892',
    projectId: 'mynotes-fd8d6',
    storageBucket: 'mynotes-fd8d6.appspot.com',
    iosClientId: '457484164892-ramqlm557r125n7i45t3gqhuthqsl0s6.apps.googleusercontent.com',
    iosBundleId: 'com.example.learningdart',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBALmHk8Huuh87CuuijRLeInmzRu54waAw',
    appId: '1:457484164892:ios:c196fbf515caf605a2a4d9',
    messagingSenderId: '457484164892',
    projectId: 'mynotes-fd8d6',
    storageBucket: 'mynotes-fd8d6.appspot.com',
    iosClientId: '457484164892-qukjubnu1nd6905bmdsi6a58ugvc35gv.apps.googleusercontent.com',
    iosBundleId: 'com.example.learningdart.RunnerTests',
  );
}
