import 'package:flutter/cupertino.dart';
import 'package:flutter_expense_tracker/models/transaction.dart';

import 'transaction_card.dart';

class TransactionList extends StatelessWidget {
  const TransactionList({
    super.key,
    required List<Transaction> transactions,
  }) : _transactions = transactions;

  final List<Transaction> _transactions;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: _transactions.map(
        (transaction) {
          return TransactionCard(
            transaction: transaction,
          );
        },
      ).toList(),
    );
  }
}
