import 'package:flutter/material.dart';
import 'package:flutter_expense_tracker/network/models/transaction.dart';

import 'transaction_item.dart';

class TransactionList extends StatelessWidget {
  const TransactionList({
    super.key,
    required List<Transaction> transactions,
    required Function(String) onDelete,
  })  : _transactions = transactions,
        _onDelete = onDelete;

  final List<Transaction> _transactions;
  final Function(String) _onDelete;

  @override
  Widget build(BuildContext context) {
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
