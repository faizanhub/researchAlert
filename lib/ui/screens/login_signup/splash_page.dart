import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'package:research_alert/ui/screens/home_screen.dart';
import 'package:research_alert/ui/screens/login_signup/login.dart';

class SplashPage extends StatelessWidget {
  SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (BuildContext context, AsyncSnapshot<User?> streamsnapshot) {
        if (streamsnapshot.hasError) {
          return Scaffold(
            body: Center(
              child: Text("${streamsnapshot.error}"),
            ),
          );
        }
        if (streamsnapshot.connectionState == ConnectionState.active) {
          User? user = streamsnapshot.data;
          if (user == null) {
            return LoginPage();
          } else {
            return const HomeScreen();
          }
        }
        return Scaffold(
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Center(child: CircularProgressIndicator()),
              ],
            ),
          ),
        );
      },
    );
  }
}
