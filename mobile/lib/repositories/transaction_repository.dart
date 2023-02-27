import 'package:flutter_expense_tracker/models/transaction.dart';

abstract class TransactionRepository {
  Future<List<Transaction>> getTransactions();
  Future<Transaction> addTransction(Transaction transaction);
  Future<void> deleteTransaction(String id);
}
