import 'package:flutter/material.dart';
import 'package:flutter_expense_tracker/features/transaction/controllers/create_transaction_form_controller.dart';

class CreateTransactionForm extends StatelessWidget {
  CreateTransactionForm({
    super.key,
    required onSubmit,
  }) : controller = CreateTransactionFormController(onSubmit: onSubmit);

  final CreateTransactionFormController controller;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            TextField(
              controller: controller.titleController,
              decoration: const InputDecoration(
                labelText: "Title",
              ),
            ),
            TextField(
              controller: controller.amountController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: "Amount",
              ),
            ),
            Container(
              height: 70,
              child: Row(
                children: const [
                  Text("No Date Chosen!"),
                  TextButton(
                    onPressed: null,
                    child: Text(
                      "Choose Date",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            ElevatedButton(
              onPressed: controller.handleSubmit,
              child: const Text("Add Transaction"),
            )
          ],
        ),
      ),
    );
  }
}
