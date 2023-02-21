import 'package:flutter/material.dart';
import 'package:flutter_expense_tracker/models/transaction.dart';

import '../../features/transaction/transaction_list.dart';
import '../../features/transaction/create_transaction_form.dart';

class AppFragment extends StatefulWidget {
  const AppFragment({
    super.key,
  });

  @override
  State<AppFragment> createState() => _AppFragmentState();
}

class _AppFragmentState extends State<AppFragment> {
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

  void _stratNewTransaction(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (_) {
        return CreateTransactionForm(
          onSubmit: _addNewTransaction,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Expense Tracker"),
      ),
      body: Column(
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
            onSubmit: _addNewTransaction,
          ),
          TransactionList(
            transactions: _transactions,
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () => _stratNewTransaction(context),
      ),
    );
  }
}
