import 'package:flutter/material.dart';

class BottomSheetController {
  void closeBottomSheet(BuildContext context) {
    Navigator.of(context).pop();
  }

  void showBaseBottomSheet(BuildContext context, Widget child) {
    showModalBottomSheet(
      elevation: 10,
      isScrollControlled: true,
      context: context,
      builder: (_) {
        return Container(
          padding:
              EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: Wrap(
            children: [
              child,
            ],
          ),
        );
      },
    );
  }
}
