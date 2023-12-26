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
      throw UnsupportedError(
        'DefaultFirebaseOptions have not been configured for web - '
        'you can reconfigure this by running the FlutterFire CLI again.',
      );
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

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyArNS1STG8BSDaZMuA6HVRLhIIhQ331UJE',
    appId: '1:1092031278176:android:20583aa57108c19704e705',
    messagingSenderId: '1092031278176',
    projectId: 'alsafakw-dev-v1',
    storageBucket: 'alsafakw-dev-v1.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBFQcfRyS29pJtCHkmQnq4OhcGbZkkR3a4',
    appId: '1:1092031278176:ios:309f2bf0c4bbea7304e705',
    messagingSenderId: '1092031278176',
    projectId: 'alsafakw-dev-v1',
    storageBucket: 'alsafakw-dev-v1.appspot.com',
    androidClientId: '1092031278176-ae66f3us78n3ggk9c55md1kj5789pnu8.apps.googleusercontent.com',
    iosClientId: '1092031278176-n6ccl6lhda0ak0juj46g8jmt9dboeoog.apps.googleusercontent.com',
    iosBundleId: 'com.alsafakw.app',
  );
}
