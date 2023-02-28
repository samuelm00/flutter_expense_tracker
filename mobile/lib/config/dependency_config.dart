import 'package:flutter_expense_tracker/models/transaction.dart';
import 'package:flutter_expense_tracker/services/core/crud_service.dart';
import 'package:flutter_expense_tracker/services/transaction_service.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_expense_tracker/repositories/transactino_http_repository.dart';
import 'package:flutter_expense_tracker/repositories/transaction_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final transactionRepositoryProvider = Provider<TransactionRepository>((ref) {
  return TransactionHttpRepository(
    httpClient: http.Client(),
  );
});

final transactionServiceProvider = Provider<CrudService<Transaction>>((ref) {
  return TransactionService(
    transactionRepository: ref.watch(transactionRepositoryProvider),
  );
});
