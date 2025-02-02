import 'package:flutter/material.dart';
import 'package:flutter_expense_tracker/features/chart/widgets/chart.dart';
import 'package:flutter_expense_tracker/features/transaction/controllers/transaction_controller.dart';

import '../../features/transaction/widgets/transaction_list.dart';

class AppFragment extends StatefulWidget {
  const AppFragment({
    super.key,
  });

  @override
  State<AppFragment> createState() => _AppFragmentState();
}

class _AppFragmentState extends State<AppFragment> {
  late final transactionController = TransactionController(
    setState: setState,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Expense Tracker"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Chart(
              recentTransactions: transactionController.recentTransactions,
            ),
            const SizedBox(
              height: 16,
            ),
            TransactionList(
              transactions: transactionController.transactions,
              onDelete: transactionController.deleteTransaction,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () => transactionController.stratNewTransaction(context),
      ),
    );
  }
}
