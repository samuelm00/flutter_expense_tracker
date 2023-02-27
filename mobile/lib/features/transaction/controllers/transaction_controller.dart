import 'package:flutter/material.dart';
import 'package:flutter_expense_tracker/utils/bottom_sheet/bottom_sheet_controller.dart';
import 'package:flutter_expense_tracker/features/transaction/widgets/create_transaction_form.dart';
import 'package:flutter_expense_tracker/models/transaction.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final transactionControllerProvider = StateProvider<TransactionController>(
  (ref) => TransactionController(notifyListeners: ref.notifyListeners),
);

class TransactionController {
  TransactionController({
    required this.notifyListeners,
  });

  final BottomSheetController bottomSheetController = BottomSheetController();
  final Function() notifyListeners;

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

  void addNewTransaction(String title, double amount, DateTime date) {
    final newTx = Transaction(
      title: title,
      amount: amount,
      date: date,
      id: DateTime.now().toString(),
    );

    _transactions.add(newTx);
    notifyListeners();
  }

  void deleteTransaction(String id) {
    _transactions.removeWhere((element) => element.id == id);
    notifyListeners();
  }

  void stratNewTransaction(BuildContext context) {
    bottomSheetController.showBaseBottomSheet(
      context,
      CreateTransactionForm(onSubmit: (title, amount, date) {
        addNewTransaction(title, amount, date);
        bottomSheetController.closeBottomSheet(context);
      }),
    );
  }

  @override
  String toString() {
    return _transactions.toString();
  }
}
