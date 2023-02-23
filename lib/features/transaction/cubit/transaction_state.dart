import 'package:flutter_expense_tracker/network/models/transaction.dart';

enum TransactionStatus { initial, loading, success, failure }

class TransactionState {
  TransactionState({
    this.transactions = const [],
    this.recentTransactions = const [],
    this.status = TransactionStatus.initial,
  });

  final List<Transaction> transactions;
  final List<Transaction> recentTransactions;
  final TransactionStatus status;

  TransactionState copyWith({
    List<Transaction>? transactions,
    List<Transaction>? recentTransactions,
    TransactionStatus? status,
  }) {
    return TransactionState(
      transactions: transactions ?? this.transactions,
      status: status ?? this.status,
      recentTransactions: recentTransactions ?? this.recentTransactions,
    );
  }
}
