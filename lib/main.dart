import 'package:app8/login.dart';
import 'package:app8/otp_screen.dart';
import 'package:app8/profile.dart';
import 'package:app8/settings.dart';
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

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SplashScreen(),
      debugShowCheckedModeBanner: false,
      routes: {
        'phone': (context) => MyPhone(),
        'verify': (context) => MyVerify(),
        'home': (context) => profile(),
        'setting': (context) => settings(),
      },
    );
  }
}

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    // Wait for 3 seconds and then navigate to the appropriate screen
    Future.delayed(Duration(seconds: 2), () {
      Navigator.pushReplacementNamed(context, isLogin());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset('assets/splash.png', width: 150, height: 150),
            
      ),
    );
  }
}
