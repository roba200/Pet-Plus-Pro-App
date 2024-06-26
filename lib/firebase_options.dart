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
    apiKey: 'AIzaSyD-4C8BVRkHH6RVAsFafGWwfRWe3TMLI4g',
    appId: '1:342086272236:web:63dc8287f10881cd0a91c9',
    messagingSenderId: '342086272236',
    projectId: 'pet-plus-pro-00',
    authDomain: 'pet-plus-pro-00.firebaseapp.com',
    storageBucket: 'pet-plus-pro-00.appspot.com',
    measurementId: 'G-K4KC4JKM43',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyD7F8qnmzZE8vp7eQibAIsFojcYYTfWjwk',
    appId: '1:342086272236:android:6747d10a586dffaa0a91c9',
    messagingSenderId: '342086272236',
    projectId: 'pet-plus-pro-00',
    storageBucket: 'pet-plus-pro-00.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCYCwWeAE3aEhEhDwxcbn3D8qt-_mNCCEI',
    appId: '1:342086272236:ios:4993ab0732ddc5220a91c9',
    messagingSenderId: '342086272236',
    projectId: 'pet-plus-pro-00',
    storageBucket: 'pet-plus-pro-00.appspot.com',
    iosBundleId: 'com.example.petPlusPro',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCYCwWeAE3aEhEhDwxcbn3D8qt-_mNCCEI',
    appId: '1:342086272236:ios:4993ab0732ddc5220a91c9',
    messagingSenderId: '342086272236',
    projectId: 'pet-plus-pro-00',
    storageBucket: 'pet-plus-pro-00.appspot.com',
    iosBundleId: 'com.example.petPlusPro',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyD-4C8BVRkHH6RVAsFafGWwfRWe3TMLI4g',
    appId: '1:342086272236:web:fd9780e32c77ecdf0a91c9',
    messagingSenderId: '342086272236',
    projectId: 'pet-plus-pro-00',
    authDomain: 'pet-plus-pro-00.firebaseapp.com',
    storageBucket: 'pet-plus-pro-00.appspot.com',
    measurementId: 'G-FY4JE4QBQM',
  );
}
