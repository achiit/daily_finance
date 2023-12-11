import 'package:app8/homescree.dart';
import 'package:app8/login.dart';
import 'package:app8/otp_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

String isLogin() {
  final auth = FirebaseAuth.instance;
  final user = auth.currentUser;
  if (user != null) {
    return 'home';
  } else {
    return 'phone';
  }
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MaterialApp(
    initialRoute: isLogin(),
    debugShowCheckedModeBanner: false,
    routes: {
      'phone': (context) => MyPhone(),
      'verify': (context) => MyVerify(),
      'home': (context) => HomeScreen()
    },
  ));
}
