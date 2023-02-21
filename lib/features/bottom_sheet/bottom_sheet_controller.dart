import 'package:flutter/material.dart';

class BottomSheetController {
  void showBaseBottomSheet(BuildContext context, Widget child) {
    showModalBottomSheet(
      elevation: 10,
      context: context,
      builder: (_) {
        return child;
      },
    );
  }
}
