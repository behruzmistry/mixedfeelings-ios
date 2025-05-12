import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyA57o3rrhqvsCYqAuhT56f6tGVo1lKnhfg",
            authDomain: "mixedfeelings-ios.firebaseapp.com",
            projectId: "mixedfeelings-ios",
            storageBucket: "mixedfeelings-ios.firebasestorage.app",
            messagingSenderId: "266071319441",
            appId: "1:266071319441:web:0f8bd10f6a5ca5ab48b030"));
  } else {
    await Firebase.initializeApp();
  }
}
