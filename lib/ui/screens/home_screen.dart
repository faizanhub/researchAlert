import 'dart:async';

import 'package:flutter/material.dart';
import 'package:research_alert/core/services/notification_service.dart';
import 'package:research_alert/ui/screens/add_list/add_todo.dart';
import 'package:research_alert/ui/screens/add_bookmarks_screen.dart';
import 'package:research_alert/ui/screens/third_screen.dart';
import '../custom_widgets/bottombar.dart';
import '../custom_widgets/list_button.dart';
import '../custom_widgets/list_data.dart';
import '../custom_widgets/searchbar.dart';
import '../custom_widgets/custom_appbar.dart';

import 'package:receive_sharing_intent/receive_sharing_intent.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen();

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late StreamSubscription _intentDataStreamSubscription;
  List<SharedMediaFile>? _sharedFiles;
  String? _sharedText;

  @override
  void initState() {
    super.initState();

    listenNotification();
    // For sharing or opening urls/text coming from outside the app
    // while the app is in the memory

    _intentDataStreamSubscription =
        ReceiveSharingIntent.getTextStream().listen((String value) {
      if (value.contains('https://youtu.be')) {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => AddBookmarksScreen(text: value)));
      } else {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => AddTodo(text: value)));
      }
    }, onError: (err) {
      print("getLinkStream error: $err");
    });

    // For sharing or opening urls/text coming from outside the app while
    // the app is closed
    ReceiveSharingIntent.getInitialText().then((String? value) {
      if (value != null) {
        if (value.contains('https://youtu.be')) {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => AddBookmarksScreen(text: value)));
        } else {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => AddTodo(text: value)));
        }
      }
    });
  }

  listenNotification() {
    NotificationService.onNotifications.stream.listen(onClickedNotification);
  }

  onClickedNotification(String? payload) {
    // Navigator.pushAndRemoveUntil(
    //   context,
    //   MaterialPageRoute(
    //     builder: (context) => HomeScreen(),
    //   ),
    //   (route) => false,
    // );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: CustomBottomBar(onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => AddTodo(
                      text: '',
                    )));
      }),
      body: SafeArea(
        child: ListView(
          children: [
            CustomAppBar(),
            // SearchBar(),
            ListButtonContainer(),
            Listdata(),
            // ShowDataPage(),
          ],
        ),
      ),
    );
  }
}
