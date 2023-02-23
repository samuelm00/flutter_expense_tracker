import 'package:flutter_expense_tracker/network/apis/transaction_api.dart';
import 'package:flutter_expense_tracker/network/models/transaction.dart';

class TransactionService {
  const TransactionService({required this.transactionApi});

  final TansactionApi transactionApi;

  Stream<List<Transaction>> getTransactions() =>
      transactionApi.getTransactions();

  Future<Transaction> createTransaction(Transaction transaction) =>
      transactionApi.createTransaction(transaction);

  Future<void> deleteTransaction(String id) =>
      transactionApi.deleteTransaction(id);
}
