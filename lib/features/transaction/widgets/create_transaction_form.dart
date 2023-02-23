import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_expense_tracker/features/transaction/controllers/create_transaction_form_controller.dart';
import 'package:flutter_expense_tracker/features/transaction/cubit/transaction_bloc.dart';
import 'package:flutter_expense_tracker/features/transaction/cubit/transaction_event.dart';
import 'package:flutter_expense_tracker/utils/bottom_sheet/bottom_sheet_controller.dart';
import 'package:intl/intl.dart';

import '../../../network/models/transaction.dart';

class CreateTransactionForm extends StatefulWidget {
  CreateTransactionForm({
    super.key,
  });

  final CreateTransactionFormController controller =
      CreateTransactionFormController();
  final BottomSheetController bottomSheetController = BottomSheetController();

  @override
  State<CreateTransactionForm> createState() => _CreateTransactionFormState();
}

class _CreateTransactionFormState extends State<CreateTransactionForm> {
  @override
  void dispose() {
    super.dispose();
    widget.controller.dispose();
  }

  void handleSubmit() {
    widget.controller.handleSubmit((title, amount, date) {
      context.read<TransactionBloc>().add(
            CreateTransactionEvent(
              Transaction(
                title: title,
                amount: amount,
                date: date,
                id: DateTime.now().toString(),
              ),
            ),
          );
      widget.bottomSheetController.closeBottomSheet(context);
    });
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
              onPressed: handleSubmit,
              child: const Text("Add Transaction"),
            )
          ],
        ),
      ),
    );
  }
}
