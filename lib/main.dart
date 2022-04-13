import 'package:flutter/material.dart';
import 'package:research_alert/log_splash/splash_page.dart';
import 'package:research_alert/screens/home_screen.dart';
import 'log_splash/login.dart';
import 'log_splash/splashpage.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Research Alert',
      theme: ThemeData(
        primaryColor: Colors.deepPurple,
        fontFamily: 'roboto-regular',
      ),
      home: SplashPage(),
      // home: const SplashPage(),
      // routes: {
      //   SplashPage.id: (context) => const SplashPage(),
      //   LoginPage.id: (context) => LoginPage(),
      // },
    );
  }
}
