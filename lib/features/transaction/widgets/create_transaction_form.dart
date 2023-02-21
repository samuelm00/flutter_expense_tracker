import 'package:flutter/material.dart';

class CreateTransactionForm extends StatelessWidget {
  CreateTransactionForm({
    super.key,
    required this.onSubmit,
  });

  final Function(String, double) onSubmit;
  final titleController = TextEditingController();
  final amountController = TextEditingController();

  bool _isInputValid() {
    final title = titleController.text;

    if (amountController.text.isEmpty) {
      return false;
    }

    final amount = double.parse(amountController.text);

    if (title.isEmpty || amount <= 0) {
      return false;
    }

    return true;
  }

  void _onSubmit() {
    if (_isInputValid()) {
      final title = titleController.text;
      final amount = double.parse(amountController.text);

      onSubmit(title, amount);

      titleController.clear();
      amountController.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            TextField(
              controller: titleController,
              decoration: const InputDecoration(
                labelText: "Title",
              ),
            ),
            TextField(
              controller: amountController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: "Amount",
              ),
            ),
            ElevatedButton(
              onPressed: _onSubmit,
              child: const Text("Add Transaction"),
            )
          ],
        ),
      ),
    );
  }
}
