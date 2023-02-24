import 'package:flutter_expense_tracker/network/apis/transaction_api.dart';
import 'package:flutter_expense_tracker/network/models/transaction.dart';
import 'package:get_it/get_it.dart';

class TransactionService {
  TransactionService() : _transactionApi = GetIt.instance.get<TransactionApi>();

  final TransactionApi _transactionApi;

  Stream<List<Transaction>> getTransactions() =>
      _transactionApi.getTransactions();

  Future<Transaction> createTransaction(Transaction transaction) =>
      _transactionApi.createTransaction(transaction);

  Future<void> deleteTransaction(String id) =>
      _transactionApi.deleteTransaction(id);

  Stream<List<Transaction>> getRecentTransactions() {
    return _transactionApi.getTransactions().map(
          (transactions) => transactions.where(
            (element) {
              return element.date.isAfter(
                DateTime.now().subtract(
                  const Duration(days: 7),
                ),
              );
            },
          ).toList(),
        );
  }
}
