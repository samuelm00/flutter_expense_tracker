import 'package:flutter/material.dart';

class CreateTransactionForm extends StatelessWidget {
  CreateTransactionForm({
    super.key,
    required this.onSubmit,
  });

  final Function(String, double) onSubmit;
  final titleController = TextEditingController();
  final amountController = TextEditingController();

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
              decoration: const InputDecoration(
                labelText: "Amount",
              ),
            ),
            ElevatedButton(
              onPressed: () {
                onSubmit(
                  titleController.text,
                  double.parse(amountController.text),
                );
              },
              child: const Text("Add Transaction"),
            )
          ],
        ),
      ),
    );
  }
}
