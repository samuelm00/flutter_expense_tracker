import 'package:flutter/cupertino.dart';
import 'package:flutter_expense_tracker/models/transaction.dart';

import 'transaction_card.dart';

class TransactionList extends StatelessWidget {
  const TransactionList({
    super.key,
    required this.transactions,
  });

  final List<Transaction> transactions;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: transactions.map(
        (transaction) {
          return TransactionCard(
            transaction: transaction,
          );
        },
      ).toList(),
    );
  }
}
