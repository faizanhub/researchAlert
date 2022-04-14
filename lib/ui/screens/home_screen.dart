import 'dart:async';

import 'package:flutter/material.dart';
import 'package:research_alert/ui/screens/add_list/add_todo.dart';
import '../custom_widgets/bottombar.dart';
import '../custom_widgets/list_button.dart';
import '../custom_widgets/list_data.dart';
import '../custom_widgets/searchbar.dart';
import '../custom_widgets/custom_appbar.dart';

import 'package:receive_sharing_intent/receive_sharing_intent.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

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

    // For sharing or opening urls/text coming from outside the app
    // while the app is in the memory

    _intentDataStreamSubscription =
        ReceiveSharingIntent.getTextStream().listen((String value) {
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => AddTodo(value: value)));
    }, onError: (err) {
      print("getLinkStream error: $err");
    });

    // For sharing or opening urls/text coming from outside the app while
    // the app is closed
    ReceiveSharingIntent.getInitialText().then((String? value) {
      if (value != null) {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => AddTodo(value: value)));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: CustomBottomBar(),
      body: SafeArea(
          child: ListView(
        children: const [
          CustomAppBar(),
          SearchBar(),
          ListButtonContainer(),
          Listdata(),
          // ShowDataPage(),
        ],
      )),
    );
  }
}
