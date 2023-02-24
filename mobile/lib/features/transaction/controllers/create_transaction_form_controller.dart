import 'package:flutter/material.dart';
import 'package:flutter_expense_tracker/utils/date_picker/date_picker_controller.dart';

class CreateTransactionFormController {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  final _datePickerController = DatePickerController();

  TextEditingController get titleController => _titleController;
  TextEditingController get amountController => _amountController;
  DatePickerController get datePickerController => _datePickerController;

  bool _isInputValid() {
    final title = _titleController.text;

    if (_amountController.text.isEmpty ||
        _datePickerController.selectedDate == null) {
      return false;
    }

    final amount = double.parse(_amountController.text);

    if (title.isEmpty || amount <= 0) {
      return false;
    }

    return true;
  }

  void handleSubmit(Function(String, double, DateTime) callback) {
    if (_isInputValid()) {
      final title = _titleController.text;
      final amount = double.parse(_amountController.text);

      callback(title, amount, _datePickerController.selectedDate!);

      _titleController.clear();
      _amountController.clear();
    }
  }

  void dispose() {
    _titleController.dispose();
    _amountController.dispose();
  }
}
