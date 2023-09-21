import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyDHNi-SkihyQ_hwej3THvBLTJ-8hFpyx84",
            authDomain: "tantan-173711.firebaseapp.com",
            projectId: "tantan-173711",
            storageBucket: "tantan-173711.appspot.com",
            messagingSenderId: "613614613520",
            appId: "1:613614613520:web:99252ecf972249ef308695"));
  } else {
    await Firebase.initializeApp();
  }
}
