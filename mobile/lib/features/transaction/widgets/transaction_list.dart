import 'package:flutter/cupertino.dart';
import 'package:flutter_expense_tracker/features/transaction/controllers/transaction_controller.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'transaction_item.dart';

class TransactionList extends ConsumerWidget {
  TransactionList({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final transactions = ref.watch(transactionControllerProvider).transactions;

    return Expanded(
      child: ListView.builder(
        itemBuilder: (context, index) => TransactionItem(
          transaction: transactions[index],
          onDelete: ref.watch(transactionControllerProvider).deleteTransaction,
        ),
        itemCount: transactions.length,
      ),
    );
  }
}
