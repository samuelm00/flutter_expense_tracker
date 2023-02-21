import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_expense_tracker/models/transaction.dart';
import 'package:flutter_expense_tracker/widgets/transaction/create_transaction_form.dart';
import 'package:flutter_expense_tracker/widgets/transaction/transaction_list.dart';

class TransactionFeed extends StatefulWidget {
  const TransactionFeed({super.key});

  @override
  State<TransactionFeed> createState() => _TransactionFeedState();
}

class _TransactionFeedState extends State<TransactionFeed> {
  final List<Transaction> transactions = [
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

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CreateTransactionForm(
          onSubmit: (title, amount) => {},
        ),
        TransactionList(transactions: transactions),
      ],
    );
  }
}
