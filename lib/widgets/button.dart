import 'package:flutter/material.dart';

class Buttonw extends StatelessWidget {
  String? title;
  VoidCallback? onPress;
  bool? isLoginButton;
  bool? isLoading;

  Buttonw(
      {Key? key,
      this.title,
      this.onPress,
      this.isLoginButton,
      this.isLoading = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        height: 45,
        width: 250,
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 88, 87, 87),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Stack(
          children: [
            Visibility(
              visible: isLoading! ? false : true,
              child: Center(
                child: Text(
                  title ?? "Button",
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            Visibility(
                visible: isLoading!,
                child: Center(child: CircularProgressIndicator.adaptive())),
          ],
        ),
      ),
    );
  }
}
