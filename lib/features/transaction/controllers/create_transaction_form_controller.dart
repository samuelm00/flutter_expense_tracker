import 'package:flutter/material.dart';

class CreateTransactionFormController {
  CreateTransactionFormController({
    required this.onSubmit,
  });

  final Function(String, double) onSubmit;
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();

  bool _isInputValid() {
    final title = _titleController.text;

    if (_amountController.text.isEmpty) {
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

      onSubmit(title, amount);

      _titleController.clear();
      _amountController.clear();
    }
  }

  TextEditingController get titleController => _titleController;
  TextEditingController get amountController => _amountController;

  void dispose() {
    _titleController.dispose();
    _amountController.dispose();
  }
}
