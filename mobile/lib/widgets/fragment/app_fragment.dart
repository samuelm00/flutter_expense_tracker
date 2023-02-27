import 'package:flutter/material.dart';
import 'package:flutter_expense_tracker/features/chart/widgets/chart.dart';
import 'package:flutter_expense_tracker/features/transaction/controllers/transaction_controller.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../features/transaction/widgets/transaction_list.dart';

class AppFragment extends ConsumerWidget {
  const AppFragment({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Expense Tracker"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Chart(),
            const SizedBox(
              height: 16,
            ),
            TransactionList(),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () => ref
            .watch(transactionControllerProvider)
            .stratNewTransaction(context),
      ),
    );
  }
}
