import 'package:flutter/material.dart';
import 'package:flutter_expense_tracker/features/chart/widgets/chart.dart';
import 'package:flutter_expense_tracker/features/transaction/controllers/transaction_controller/transaction_controller.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../features/transaction/widgets/transaction_list.dart';

class AppFragment extends ConsumerStatefulWidget {
  const AppFragment({
    super.key,
  });

  @override
  ConsumerState<AppFragment> createState() => _AppFragmentState();
}

class _AppFragmentState extends ConsumerState<AppFragment> {
  @override
  void initState() {
    super.initState();
    ref.read(transactionControllerProvider.notifier).fetchTransactions();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(transactionControllerProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Expense Tracker"),
      ),
      body: state.isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Chart(
                    recentTransactions: state.value?.transactions ?? [],
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  const TransactionList(),
                ],
              ),
            ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () => ref
            .watch(transactionControllerProvider.notifier)
            .startCreateNewTransaction(context),
      ),
    );
  }
}
