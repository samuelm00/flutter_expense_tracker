import 'package:flutter_expense_tracker/models/transaction.dart';
import 'package:flutter_expense_tracker/repositories/transaction_repository.dart';

class TransactionService {
  final TransactionRepository _transactionRepository;

  TransactionService({required TransactionRepository transactionRepository})
      : _transactionRepository = transactionRepository;

  Future<List<Transaction>> getTransactions() async {
    return await _transactionRepository.getTransactions();
  }

  Future<List<Transaction>> getRecentTransactions(String id) async {
    final transactions = await _transactionRepository.getTransactions();

    return transactions.where((element) {
      return element.date.isAfter(
        DateTime.now().subtract(
          const Duration(days: 7),
        ),
      );
    }).toList();
  }

  Future<Transaction> addTransaction(Transaction transaction) async {
    return await _transactionRepository.addTransction(transaction);
  }

  Future<void> deleteTransaction(String id) async {
    return await _transactionRepository.deleteTransaction(id);
  }
}
