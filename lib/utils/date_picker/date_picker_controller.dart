import 'package:flutter/material.dart';

class DatePickerController {
  void showBaseDatePicker(
      {required BuildContext context,
      required Widget child,
      DateTime? initialDate,
      DateTime? firstDate,
      DateTime? lastDate}) {
    showDatePicker(
      context: context,
      initialDate: initialDate ?? DateTime.now(),
      firstDate: firstDate ?? DateTime(2000),
      lastDate: lastDate ?? DateTime(2100),
    );
  }
}
