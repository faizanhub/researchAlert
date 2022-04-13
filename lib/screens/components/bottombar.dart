import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:research_alert/firebase_services/database_services.dart';
import 'package:research_alert/screens/add_list/add_todo.dart';
// import 'package:todo_app/Screens/add_list/add_todo.dart';

class CustomBottomBar extends StatelessWidget {
  const CustomBottomBar({
    Key? key,
  }) : super(key: key);

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
                Authentication.signOut();
              },
              icon: const Icon(Icons.logout)),
          InkWell(
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Addtodo()));
            },
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
