import 'package:flutter/material.dart';

class TextFieldW extends StatefulWidget {
  String? hintText;
  TextEditingController? controller;
  String? Function(String?)? validate;
  Widget? icon;
  bool isPassword;
  bool check;
  final TextInputAction? inputAction;
  final FocusNode? focusNode;

  TextFieldW({
    Key? key,
    this.hintText,
    this.controller,
    this.validate,
    this.check = false,
    this.isPassword = false,
    this.icon,
    this.inputAction,
    this.focusNode,
  }) : super(key: key);

  @override
  State<TextFieldW> createState() => _TextFieldWState();
}

class _TextFieldWState extends State<TextFieldW> {
  bool visible = false;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      focusNode: widget.focusNode,
      textInputAction: widget.inputAction,
      controller: widget.controller,
      obscureText: widget.isPassword == false ? false : widget.isPassword,
      validator: widget.validate,
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(
            color: Colors.white,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(
            color: Colors.black,
          ),
        ),
        hintText: widget.hintText ?? "hint Text....",
        suffixIcon: widget.icon,
        hintStyle: const TextStyle(color: Colors.white),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}
