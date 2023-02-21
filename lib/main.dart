import 'package:flutter/material.dart';
import 'package:flutter_expense_tracker/models/transaction.dart';

import 'widgets/transaction/create_transaction_form.dart';
import 'widgets/transaction/transaction_list.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Expense Tracker',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({super.key});

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
    return Scaffold(
      appBar: AppBar(
        title: const Text("Expense Tracker"),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Card(
              child: Container(
                color: Colors.blue,
                width: double.infinity,
                child: const Text("Chart!"),
              ),
            ),
            CreateTransactionForm(
              onSubmit: (title, amount) => {},
            ),
            TransactionList(transactions: transactions),
          ],
        ),
      ),
    );
  }
}
