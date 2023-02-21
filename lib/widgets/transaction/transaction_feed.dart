import 'package:flutter/material.dart';
import 'package:flutter_expense_tracker/models/transaction.dart';
import 'package:flutter_expense_tracker/widgets/transaction/create_transaction_form.dart';
import 'package:flutter_expense_tracker/widgets/transaction/transaction_list.dart';

class TransactionFeed extends StatefulWidget {
  const TransactionFeed({super.key});

  @override
  State<TransactionFeed> createState() => _TransactionFeedState();
}

class _TransactionFeedState extends State<TransactionFeed> {
  final List<Transaction> _transactions = [
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

  void _addNewTransaction(String title, double amount) {
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

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CreateTransactionForm(
          onSubmit: _addNewTransaction,
        ),
        TransactionList(
          transactions: _transactions,
        )
      ],
    );
  }
}
