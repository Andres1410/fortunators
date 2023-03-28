import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyCHiviT1c0AFHBv_MOXAwArtKKtaNZaJ0I",
            authDomain: "fortunators-e600b.firebaseapp.com",
            projectId: "fortunators-e600b",
            storageBucket: "fortunators-e600b.appspot.com",
            messagingSenderId: "788826933540",
            appId: "1:788826933540:web:95299dcd170d096b840bb1"));
  } else {
    await Firebase.initializeApp();
  }
}
