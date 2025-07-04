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
    apiKey: 'AIzaSyBOs4eeYpoAkY8041TbHvrntZNff6JzH_M',
    appId: '1:381334136006:web:8d7c68e4b511a78f7f63c7',
    messagingSenderId: '381334136006',
    projectId: 'chapatti-af935',
    authDomain: 'chapatti-af935.firebaseapp.com',
    storageBucket: 'chapatti-af935.firebasestorage.app',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBKwwpMbLDk5biK5dVrdsHUL_Db2FR39ZA',
    appId: '1:381334136006:android:aa1b9b70b9b08c007f63c7',
    messagingSenderId: '381334136006',
    projectId: 'chapatti-af935',
    storageBucket: 'chapatti-af935.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAC3VQJow_CKWzbaSZqWcB1u9OmUiRYHU8',
    appId: '1:381334136006:ios:75ce8c43bcf728317f63c7',
    messagingSenderId: '381334136006',
    projectId: 'chapatti-af935',
    storageBucket: 'chapatti-af935.firebasestorage.app',
    iosBundleId: 'com.example.eprojectbaby',
  );
}
