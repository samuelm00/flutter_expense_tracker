import 'package:flutter/material.dart';

class DatePickerController {
  DateTime? _selectedDate;

  void showBaseDatePicker(
      {required BuildContext context,
      DateTime? initialDate,
      DateTime? firstDate,
      DateTime? lastDate,
      Function(Function())? setState}) async {
    final date = await showDatePicker(
      context: context,
      initialDate: initialDate ?? DateTime.now(),
      firstDate: firstDate ?? DateTime(2000),
      lastDate: lastDate ?? DateTime(2100),
    );

    _setSelectedDate(setState, date);
  }

  void _setSelectedDate(Function(Function())? setState, date) {
    if (setState == null) {
      _selectedDate = date;
    } else {
      setState(() {
        _selectedDate = date;
      });
    }
  }

  get selectedDate => _selectedDate;
}
