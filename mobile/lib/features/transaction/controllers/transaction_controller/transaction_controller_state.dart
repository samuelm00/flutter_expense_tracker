import 'package:flutter_expense_tracker/models/transaction.dart';

class TransactionControllerState {
  TransactionControllerState({
    required this.transactions,
  });

  final List<Transaction> transactions;

  TransactionControllerState copyWith({
    List<Transaction>? transactions,
  }) {
    return TransactionControllerState(
      transactions: transactions ?? this.transactions,
    );
  }
}
