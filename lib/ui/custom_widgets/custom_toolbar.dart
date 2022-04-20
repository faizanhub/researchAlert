import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart';

class CustomToolBar extends StatelessWidget {
  final QuillController controller;

  const CustomToolBar(this.controller);

  @override
  Widget build(BuildContext context) {
    return QuillToolbar.basic(
      controller: controller,
      showDividers: false,
      // showBoldButton :   false,
      //  showItalicButton :   false,
      showSmallButton: false,
      // showUnderLineButton :   false,
      showStrikeThrough: false,
      showInlineCode: false,
      showColorButton: false,
      showBackgroundColorButton: false,
      showClearFormat: false,
      showAlignmentButtons: false,
      showLeftAlignment: false,
      showCenterAlignment: false,
      showRightAlignment: false,
      showJustifyAlignment: false,
      showHeaderStyle: false,
      showListNumbers: false,
      showListBullets: false,
      showListCheck: false,
      showCodeBlock: false,
      showQuote: false,
      showIndent: false,
      showLink: false,
      showUndo: false,
      showRedo: false,
      multiRowsDisplay: false,
      showImageButton: false,
      showVideoButton: false,
      showCameraButton: false,
    );
  }
}
