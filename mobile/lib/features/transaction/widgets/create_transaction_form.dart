import 'package:flutter/material.dart';
import 'package:flutter_expense_tracker/features/transaction/controllers/create_transaction_form_controller.dart';
import 'package:flutter_expense_tracker/features/transaction/controllers/transaction_controller/transaction_controller.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import '../../../models/transaction.dart';

class CreateTransactionForm extends ConsumerStatefulWidget {
  const CreateTransactionForm({
    super.key,
  });

  @override
  ConsumerState<CreateTransactionForm> createState() =>
      _CreateTransactionFormState();
}

class _CreateTransactionFormState extends ConsumerState<CreateTransactionForm> {
  late CreateTransactionFormController controller;

  @override
  void initState() {
    super.initState();
    controller = CreateTransactionFormController(
      createTransaction: (Transaction transaction) {
        return ref
            .read(transactionControllerProvider.notifier)
            .addNewTransaction(transaction);
      },
    );
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
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
            SizedBox(
              height: 70,
              child: Row(
                children: [
                  Text(
                    controller.datePickerController.selectedDate == null
                        ? "No Date Chosen!"
                        : DateFormat.yMd().format(
                            controller.datePickerController.selectedDate!,
                          ),
                  ),
                  TextButton(
                    onPressed: () {
                      controller.datePickerController.showBaseDatePicker(
                        context: context,
                        setState: setState,
                      );
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
              onPressed: () => controller.handleSubmit(
                callback: () => Navigator.of(context).pop(),
              ),
              child: const Text("Add Transaction"),
            )
          ],
        ),
      ),
    );
  }
}
