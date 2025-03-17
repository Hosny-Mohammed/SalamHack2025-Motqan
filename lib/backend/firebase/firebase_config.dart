import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyBCGo1UpAhtwfV6Yx_9ETGtJ0bQov_RiTo",
            authDomain: "in-target-j9mk7b.firebaseapp.com",
            projectId: "in-target-j9mk7b",
            storageBucket: "in-target-j9mk7b.firebasestorage.app",
            messagingSenderId: "485350965959",
            appId: "1:485350965959:web:36179793f3275e5d9b74e2"));
  } else {
    await Firebase.initializeApp();
  }
}
