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
    apiKey: 'AIzaSyB5DlxwlY5-7aBasQ3fr19Ab7iRfvgMdCE',
    appId: '1:656510254:web:3db4e1927544c09cce3ebf',
    messagingSenderId: '656510254',
    projectId: 'my-projekt-baws',
    authDomain: 'my-projekt-baws.firebaseapp.com',
    storageBucket: 'my-projekt-baws.appspot.com',
    measurementId: 'G-9PZNQHWV5F',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAqoBHbAs1S1CJi6zqaREDLuUaDOoMuNUg',
    appId: '1:656510254:android:6c9156f80c16ceecce3ebf',
    messagingSenderId: '656510254',
    projectId: 'my-projekt-baws',
    storageBucket: 'my-projekt-baws.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyD_ZuuQQIOyLHy8rayu9NksQPGoQt2C_Z4',
    appId: '1:656510254:ios:bae86b4bdac51fc4ce3ebf',
    messagingSenderId: '656510254',
    projectId: 'my-projekt-baws',
    storageBucket: 'my-projekt-baws.appspot.com',
    iosBundleId: 'com.example.myProjectBaws',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyD_ZuuQQIOyLHy8rayu9NksQPGoQt2C_Z4',
    appId: '1:656510254:ios:bae86b4bdac51fc4ce3ebf',
    messagingSenderId: '656510254',
    projectId: 'my-projekt-baws',
    storageBucket: 'my-projekt-baws.appspot.com',
    iosBundleId: 'com.example.myProjectBaws',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyB5DlxwlY5-7aBasQ3fr19Ab7iRfvgMdCE',
    appId: '1:656510254:web:75af8975d34831adce3ebf',
    messagingSenderId: '656510254',
    projectId: 'my-projekt-baws',
    authDomain: 'my-projekt-baws.firebaseapp.com',
    storageBucket: 'my-projekt-baws.appspot.com',
    measurementId: 'G-36J4QFQ627',
  );

}