import 'package:flutter/material.dart';
import 'package:flutter_expense_tracker/utils/date_picker/date_picker_controller.dart';

class CreateTransactionFormController {
  CreateTransactionFormController({
    required this.onSubmit,
  });

  final Function(String, double, DateTime) onSubmit;
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  final _datePickerController = DatePickerController();

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

  void handleSubmit() {
    if (_isInputValid()) {
      final title = _titleController.text;
      final amount = double.parse(_amountController.text);

      onSubmit(title, amount, _datePickerController.selectedDate!);

      _titleController.clear();
      _amountController.clear();
    }
  }

  TextEditingController get titleController => _titleController;
  TextEditingController get amountController => _amountController;
  DatePickerController get datePickerController => _datePickerController;

  void dispose() {
    _titleController.dispose();
    _amountController.dispose();
  }
}
