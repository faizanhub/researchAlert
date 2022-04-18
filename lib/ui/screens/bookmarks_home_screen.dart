import 'package:flutter/material.dart';
import 'package:research_alert/ui/custom_widgets/bookmarks_listData.dart';
import 'package:research_alert/ui/custom_widgets/bottombar.dart';
import 'package:research_alert/ui/custom_widgets/custom_appbar.dart';
import 'package:research_alert/ui/custom_widgets/list_button.dart';
import 'package:research_alert/ui/custom_widgets/list_data.dart';
import 'package:research_alert/ui/screens/add_bookmarks_screen.dart';

class BookmarksHomeScreen extends StatefulWidget {
  @override
  State<BookmarksHomeScreen> createState() => _BookmarksHomeScreenState();
}

class _BookmarksHomeScreenState extends State<BookmarksHomeScreen> {
  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: CustomBottomBar(onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => AddBookmarksScreen(
                      text: '',
                    )));
      }),
      body: SafeArea(
        child: ListView(
          children: [
            CustomAppBar(),
            //Title
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Row(
                children: [
                  ListsButton(
                    isActive: true,
                    press: () {},
                    title: "Bookmarks",
                  ),
                ],
              ),
            ),
            BookMarksListData(),
            // ShowDataPage(),
          ],
        ),
      ),
    );
  }
}
