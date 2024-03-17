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
    apiKey: 'AIzaSyCeOh93hupH8bV2mY2zdAWnS8wqUV18sBg',
    appId: '1:198126841194:web:4a518042b31a31176ac913',
    messagingSenderId: '198126841194',
    projectId: 'netflixclone-adf3f',
    authDomain: 'netflixclone-adf3f.firebaseapp.com',
    storageBucket: 'netflixclone-adf3f.appspot.com',
    measurementId: 'G-C76D13BJ5W',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyC8Xszc2YXlG5jOXEYKGoGvs46d54-cfgs',
    appId: '1:198126841194:android:50bf376bf8afae546ac913',
    messagingSenderId: '198126841194',
    projectId: 'netflixclone-adf3f',
    storageBucket: 'netflixclone-adf3f.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCA33sEzKJxRQ9ioJ6u_T2hGl38EBYXqaE',
    appId: '1:198126841194:ios:40b71b21c952b8ed6ac913',
    messagingSenderId: '198126841194',
    projectId: 'netflixclone-adf3f',
    storageBucket: 'netflixclone-adf3f.appspot.com',
    iosClientId: '198126841194-067n1obqjiu8svp51g2lhkavoe2618h9.apps.googleusercontent.com',
    iosBundleId: 'com.netflixclone.netflixClone',
  );
}
