import 'package:flutter/material.dart';
import 'package:freshcart/AuthFile/LoginPage.dart';
import 'package:freshcart/AuthFile/SignupPage.dart';
import 'package:freshcart/Home/Home.dart';
import 'package:freshcart/Onboarding/Onboard.dart';
import 'package:freshcart/Splash/Splash.dart';
import 'package:freshcart/Startpage/Startedpage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Splash_Screen(),
      routes: {
        '/home' : (context) => Home(),
        '/splash' : (context) => Splash_Screen(),
        '/onboard' : (context) => Onboard(),
        '/welcome' : (context) => WelcomeScreen(),
        '/login' : (context) => Loginpage(),
        '/sign' : (context) => Signuppage(),  
      },
    );
  }
}

