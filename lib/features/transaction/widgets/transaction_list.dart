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
    return Expanded(
      child: ListView.builder(
        itemBuilder: (context, index) => TransactionItem(
          transaction:
              ref.watch(transactionControllerProvider).transactions[index],
          onDelete: ref.watch(transactionControllerProvider).deleteTransaction,
        ),
        itemCount: ref.watch(transactionControllerProvider).transactions.length,
      ),
    );
  }
}
