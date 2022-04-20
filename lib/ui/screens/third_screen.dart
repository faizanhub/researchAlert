import 'package:flutter/material.dart';

class ThirdScreen extends StatelessWidget {
  ThirdScreen({required this.payload});

  String? payload;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('payload ${payload}'),
          ],
        ),
      ),
    );
  }
}
