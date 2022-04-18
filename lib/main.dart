import 'package:flutter/material.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:research_alert/core/services/notification_service.dart';
import 'package:research_alert/ui/custom_widgets/list_data.dart';
import 'package:research_alert/ui/screens/login_signup/splash_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  // await NotificationService.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Research Alerts',
      theme: ThemeData(
        primaryColor: Colors.deepPurple,
        fontFamily: 'roboto-regular',
      ),
      home: SplashPage(),
    );
  }
}
