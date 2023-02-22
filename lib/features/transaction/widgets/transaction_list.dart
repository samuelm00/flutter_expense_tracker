import 'package:flutter/cupertino.dart';
import 'package:flutter_expense_tracker/features/transaction/controllers/transaction_controller.dart';
import 'package:flutter_expense_tracker/models/transaction.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'transaction_item.dart';

class TransactionList extends ConsumerWidget {
  TransactionList({
    super.key,
  });

  late final List<Transaction> _transactions;
  late final Function(String) _onDelete;

  void initTransactionList(WidgetRef ref) {
    _transactions = ref.watch(transactionControllerProvider).transactions;
    _onDelete = ref
        .watch(transactionControllerProvider.notifier)
        .state
        .deleteTransaction;
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    initTransactionList(ref);

    return Expanded(
      child: ListView.builder(
        itemBuilder: (context, index) => TransactionItem(
          transaction: _transactions[index],
          onDelete: _onDelete,
        ),
        itemCount: _transactions.length,
      ),
    );
  }
}
