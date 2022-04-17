import 'package:flutter/material.dart';

void showAlertDialog(BuildContext context, String title, desc) {
  showDialog(
      context: context,
      builder: (ctx) {
        return AlertDialog(
          title: Text(title),
          content: Text(desc),
        );
      });
}
