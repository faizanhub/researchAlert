import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:research_alert/core/services/auth_service.dart';
import 'package:research_alert/core/services/database_services.dart';
import 'package:research_alert/ui/screens/login_signup/login.dart';

// import 'package:todo_app/Screens/add_note/add_notes.dart';

class CustomBottomBarNotes extends StatelessWidget {
  final Function()? boldOnTap;
  final Function()? italicOnTap;
  final Function()? scheduleOnTap;

  const CustomBottomBarNotes({
    this.boldOnTap,
    this.italicOnTap,
    this.scheduleOnTap,
  });

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
        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // IconButton(
          //     onPressed: boldOnTap,
          //     icon: const Icon(Icons.format_bold_outlined)),
          // IconButton(
          //     onPressed: italicOnTap,
          //     icon: const Icon(Icons.format_italic_outlined)),
          IconButton(
              onPressed: scheduleOnTap,
              icon: const Icon(Icons.schedule_outlined)),
        ],
      ),
    );
  }
}
