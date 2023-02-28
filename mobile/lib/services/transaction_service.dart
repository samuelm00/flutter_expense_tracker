import 'package:flutter_expense_tracker/models/transaction.dart';
import 'package:flutter_expense_tracker/repositories/transaction_repository.dart';
import 'package:flutter_expense_tracker/services/core/crud_service.dart';

class TransactionService implements CrudService<Transaction> {
  final TransactionRepository _transactionRepository;

  TransactionService({required TransactionRepository transactionRepository})
      : _transactionRepository = transactionRepository;

  @override
  Future<List<Transaction>> getItems() async {
    return await _transactionRepository.getTransactions();
  }

  @override
  Future<Transaction> addItem(Transaction transaction) {
    return _transactionRepository.addTransction(transaction);
  }

  @override
  Future<void> deleteItem(String id) async {
    return await _transactionRepository.deleteTransaction(id);
  }
}
