import 'package:flutter/material.dart';

class ListButtonContainer extends StatelessWidget {
  const ListButtonContainer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          ListsButton(
            isActive: true,
            press: () {},
            title: "Notes",
          ),
          ListsButton(
            press: () {},
            title: "Book Marks",
          ),
        ],
      ),
    );
  }
}

// ignore: must_be_immutable
class ListsButton extends StatelessWidget {
  final String title;
  final VoidCallback press;
  bool isActive;

  ListsButton({
    this.isActive = false,
    required this.title,
    required this.press,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: press,
        child: Text(
          title,
          style: TextStyle(
              fontSize: 19,
              color: isActive == true ? Colors.blue[400] : Colors.black54,
              fontWeight:
                  isActive == true ? FontWeight.bold : FontWeight.normal),
        ));
  }
}
