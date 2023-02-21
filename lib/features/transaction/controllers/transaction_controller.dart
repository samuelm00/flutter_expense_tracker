import 'package:flutter/material.dart';
import 'package:flutter_expense_tracker/features/bottom_sheet/bottom_sheet_controller.dart';
import 'package:flutter_expense_tracker/features/transaction/widgets/create_transaction_form.dart';
import 'package:flutter_expense_tracker/models/transaction.dart';

class TransactionController {
  final void Function(Function()) setState;
  final BottomSheetController bottomSheetController = BottomSheetController();

  final _transactions = <Transaction>[
    Transaction(
      id: "t1",
      title: "New Shoes",
      amount: 69.99,
      date: DateTime.now(),
    ),
    Transaction(
      id: "t2",
      title: "Weekly Groceries",
      amount: 16.53,
      date: DateTime.now(),
    ),
  ];

  TransactionController({required this.setState});

  get transactions => _transactions;

  List<Transaction> get recentTransactions {
    return _transactions.where((element) {
      return element.date.isAfter(
        DateTime.now().subtract(
          const Duration(days: 7),
        ),
      );
    }).toList();
  }

  void addNewTransaction(String title, double amount) {
    final newTx = Transaction(
      title: title,
      amount: amount,
      date: DateTime.now(),
      id: DateTime.now().toString(),
    );

    setState(() {
      _transactions.add(newTx);
    });
  }

  void stratNewTransaction(BuildContext context) {
    bottomSheetController.showBaseBottomSheet(
      context,
      CreateTransactionForm(onSubmit: (title, amount) {
        addNewTransaction(title, amount);
        bottomSheetController.closeBottomSheet(context);
      }),
    );
  }
}
