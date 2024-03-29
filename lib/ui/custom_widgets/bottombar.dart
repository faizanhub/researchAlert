import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:research_alert/core/services/auth_service.dart';
import 'package:research_alert/core/services/database_services.dart';
import 'package:research_alert/ui/screens/login_signup/login.dart';

// import 'package:todo_app/Screens/add_note/add_notes.dart';

class CustomBottomBar extends StatelessWidget {
  AuthService _authService = AuthService();

  final void Function()? onTap;

  CustomBottomBar({this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      decoration: BoxDecoration(color: Colors.white, boxShadow: [
        BoxShadow(
          color: Colors.blue.withOpacity(0.5),
          spreadRadius: 2.0,
          blurRadius: 8.0,
        )
      ]),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (ctx) {
                      return AlertDialog(
                        title: const Text('Logout'),
                        content: const Text('Do you want to Logout?'),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: const Text('Cancel',
                                style: TextStyle(color: Colors.red)),
                          ),
                          TextButton(
                            onPressed: () {
                              _authService.signOut();
                              Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => LoginPage()),
                                (route) => false,
                              );
                            },
                            child: const Text('Ok'),
                          ),
                        ],
                      );
                    });
              },
              icon: const Icon(Icons.logout)),
          InkWell(
            onTap: onTap,
            child: Container(
              padding: const EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                color: Colors.blue[400],
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.add,
                color: Colors.white,
              ),
            ),
          ),
          IconButton(
              onPressed: () {}, icon: const Icon(Icons.person_outline_rounded)),
        ],
      ),
    );
  }
}
