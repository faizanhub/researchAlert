import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:research_alert/log_splash/login.dart';
import 'package:research_alert/screens/home_screen.dart';

class SplashPage extends StatelessWidget {
  SplashPage({Key? key}) : super(key: key);
  Future<FirebaseApp> initilize = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: initilize,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasError) {
            return Scaffold(
              body: Center(
                child: Text("${snapshot.error}"),
              ),
            );
          }
          if (snapshot.connectionState == ConnectionState.done) {
            return StreamBuilder(
              stream: FirebaseAuth.instance.authStateChanges(),
              builder:
                  (BuildContext context, AsyncSnapshot<User?> streamsnapshot) {
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
                      Text(
                        "CHECKING AUTHENTICATION",
                        textAlign: TextAlign.center,
                      ),
                      CircularProgressIndicator(),
                    ],
                  )),
                );
              },
            );
          }
          return Scaffold(
            body: Center(
              child: Column(
                children: [
                  Expanded(child: Image.asset('images/logo.png')),
                  const Expanded(
                      child: Center(child: CircularProgressIndicator())),
                ],
              ),
            ),
          );
        });
  }
}
