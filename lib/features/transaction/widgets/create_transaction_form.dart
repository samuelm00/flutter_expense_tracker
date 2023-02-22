import 'package:flutter/material.dart';
import 'package:flutter_expense_tracker/features/transaction/controllers/create_transaction_form_controller.dart';
import 'package:intl/intl.dart';

class CreateTransactionForm extends StatefulWidget {
  CreateTransactionForm({
    super.key,
    required Function(String, double, DateTime) onSubmit,
  }) : controller = CreateTransactionFormController(onSubmit: onSubmit);

  final CreateTransactionFormController controller;

  @override
  State<CreateTransactionForm> createState() => _CreateTransactionFormState();
}

class _CreateTransactionFormState extends State<CreateTransactionForm> {
  @override
  void dispose() {
    super.dispose();
    widget.controller.dispose();
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
              controller: widget.controller.titleController,
              decoration: const InputDecoration(
                labelText: "Title",
              ),
            ),
            TextField(
              controller: widget.controller.amountController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: "Amount",
              ),
            ),
            SizedBox(
              height: 70,
              child: Row(
                children: [
                  Text(
                    widget.controller.datePickerController.selectedDate == null
                        ? "No Date Chosen!"
                        : DateFormat.yMd().format(
                            widget
                                .controller.datePickerController.selectedDate!,
                          ),
                  ),
                  TextButton(
                    onPressed: () {
                      widget.controller.datePickerController.showBaseDatePicker(
                          context: context, setState: setState);
                    },
                    child: const Text(
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
              onPressed: widget.controller.handleSubmit,
              child: const Text("Add Transaction"),
            )
          ],
        ),
      ),
    );
  }
}
