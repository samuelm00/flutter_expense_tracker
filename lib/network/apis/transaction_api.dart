import 'package:flutter_expense_tracker/network/models/transaction.dart';

abstract class TansactionApi {
  Stream<List<Transaction>> getTransactions();
  Future<Transaction> createTransaction(Transaction transaction);
  Future<void> deleteTransaction(String id);
}
