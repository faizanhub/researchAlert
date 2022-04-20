import 'dart:async';

import 'package:flutter/material.dart';
import 'package:research_alert/ui/screens/login_signup/login.dart';
import 'package:research_alert/ui/screens/login_signup/splash_page.dart';

class Splash extends StatefulWidget {
  static const id = '/Page';

  const Splash({Key? key}) : super(key: key);
  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (_) => SplashPage()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(child: Image.asset('images/logo.png')),
        ],
      ),
    );
  }
}
