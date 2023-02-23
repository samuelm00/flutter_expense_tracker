import 'package:bloc/bloc.dart';
import 'package:flutter_expense_tracker/features/transaction/cubit/transaction_event.dart';
import 'package:flutter_expense_tracker/features/transaction/cubit/transaction_state.dart';
import 'package:flutter_expense_tracker/services/transaction/transaction_service.dart';

class TransactionBloc extends Bloc<TransactionEvent, TransactionState> {
  TransactionBloc() : super(TransactionState()) {
    on<TransactionFetchEvent>(_onTransactionFetchEvent);
    on<CreateTransactionEvent>(_onCreateTransactionEvent);
    on<DeleteTransactionEvent>(_onDeleteTransactionEvent);
  }

  final TransactionService transactionService = TransactionService();

  void _onTransactionFetchEvent(
      TransactionFetchEvent event, Emitter<TransactionState> emit) {
    emit(state.copyWith(status: TransactionStatus.loading));

    emit.forEach(
      transactionService.getTransactions(),
      onData: (transaction) => state.copyWith(
        transactions: transaction,
        status: TransactionStatus.success,
      ),
      onError: (error, stackTrace) => state.copyWith(
        status: TransactionStatus.failure,
      ),
    );
  }

  void _onCreateTransactionEvent(
      CreateTransactionEvent event, Emitter<TransactionState> emit) async {
    final transaction = event.transaction;
    await transactionService.createTransaction(transaction);
    emit(state.copyWith(
      transactions: [...state.transactions, transaction],
    ));
  }

  void _onDeleteTransactionEvent(
      DeleteTransactionEvent event, Emitter<TransactionState> emit) async {
    await transactionService.deleteTransaction(event.transactionId);
    emit(state.copyWith(
      transactions: state.transactions
          .where((transaction) => transaction.id != event.transactionId)
          .toList(),
    ));
  }
}
