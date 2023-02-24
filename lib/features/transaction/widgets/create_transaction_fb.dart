import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_expense_tracker/features/transaction/bloc/transaction_bloc.dart';
import 'package:flutter_expense_tracker/features/transaction/bloc/transaction_event.dart';
import 'package:flutter_expense_tracker/features/transaction/widgets/create_transaction_form.dart';
import 'package:flutter_expense_tracker/network/models/transaction.dart';
import 'package:flutter_expense_tracker/utils/bottom_sheet/bottom_sheet_controller.dart';

class CreateTransactionFB extends StatelessWidget {
  CreateTransactionFB({
    super.key,
  });

  final BottomSheetController bottomSheetController = BottomSheetController();

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      child: const Icon(Icons.add),
      onPressed: () => bottomSheetController.showBaseBottomSheet(
        context,
        CreateTransactionForm(
          onSubmit: (title, amount, date) {
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
            bottomSheetController.closeBottomSheet(context);
          },
        ),
      ),
    );
  }
}
