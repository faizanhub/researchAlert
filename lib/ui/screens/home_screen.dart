import 'package:flutter/material.dart';
import '../custom_widgets/bottombar.dart';
import '../custom_widgets/list_button.dart';
import '../custom_widgets/list_data.dart';
import '../custom_widgets/searchbar.dart';
import '../custom_widgets/custom_appbar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
