import 'package:flutter/material.dart';
import 'package:flutter_expense_tracker/models/transaction.dart';
import 'package:flutter_expense_tracker/widgets/transaction/transaction_description.dart';
import 'package:flutter_expense_tracker/widgets/transaction/transaction_price.dart';

class TransactionCard extends StatelessWidget {
  const TransactionCard({
    super.key,
    required this.transaction,
  });

  final Transaction transaction;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Row(
        children: [
          TransactionPrice(
            amount: transaction.getAmount,
          ),
          TransactionDescription(
            title: transaction.getTitle,
            date: transaction.getDate,
          ),
        ],
      ),
    );
  }
}
