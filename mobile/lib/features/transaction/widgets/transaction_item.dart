import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_expense_tracker/features/transaction/bloc/transaction_bloc.dart';
import 'package:flutter_expense_tracker/features/transaction/bloc/transaction_event.dart';
import 'package:intl/intl.dart';

import '../../../network/models/transaction.dart';

class TransactionItem extends StatelessWidget {
  const TransactionItem({super.key, required this.transaction});

  final Transaction transaction;

  void _deleteTransaction(BuildContext context) {
    context
        .read<TransactionBloc>()
        .add(DeleteTransactionEvent(transactionId: transaction.id));
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: ListTile(
        title: Text(
          transaction.title,
          style: Theme.of(context).textTheme.titleLarge,
        ),
        subtitle: Text(
          DateFormat.yMMMd().format(transaction.date),
          style: Theme.of(context).textTheme.labelMedium,
        ),
        trailing: IconButton(
          icon: Icon(
            Icons.delete,
            color: Theme.of(context).colorScheme.error,
          ),
          onPressed: () {
            _deleteTransaction(context);
          },
        ),
        leading: CircleAvatar(
          backgroundColor: Theme.of(context).primaryColor,
          child: Padding(
            padding: const EdgeInsets.all(4.0),
            child: FittedBox(
              child: Text(
                transaction.amount.toStringAsFixed(2),
                style: const TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
