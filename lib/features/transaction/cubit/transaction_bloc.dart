import 'package:bloc/bloc.dart';
import 'package:flutter_expense_tracker/features/transaction/cubit/transaction_event.dart';
import 'package:flutter_expense_tracker/features/transaction/cubit/transaction_state.dart';
import 'package:flutter_expense_tracker/services/transaction/transaction_service.dart';

class TransactionBloc extends Bloc<TransactionEvent, TransactionState> {
  TransactionBloc() : super(TransactionState()) {
    on<TransactionFetchEvent>(_onTransactionFetchEvent);
    on<CreateTransactionEvent>(_onCreateTransactionEvent);
    on<DeleteTransactionEvent>(_onDeleteTransactionEvent);
    on<TransactionFetchReventEvent>(_onTransactionFetchRecentEvent);
  }

  final TransactionService transactionService = TransactionService();

  void _onTransactionFetchRecentEvent(
      TransactionFetchReventEvent event, Emitter<TransactionState> emit) async {
    await emit.forEach(
      transactionService.getRecentTransactions(),
      onData: (transaction) => state.copyWith(
        recentTransactions: transaction,
        status: TransactionStatus.success,
      ),
      onError: (error, stackTrace) => state.copyWith(
        status: TransactionStatus.failure,
      ),
    );
  }

  void _onTransactionFetchEvent(
      TransactionFetchEvent event, Emitter<TransactionState> emit) async {
    emit(state.copyWith(status: TransactionStatus.loading));

    await emit.forEach(
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

    await transactionService.getRecentTransactions().forEach(
          (recentTransactions) => emit(
            state.copyWith(
              recentTransactions: recentTransactions,
            ),
          ),
        );
  }

  void _onDeleteTransactionEvent(
      DeleteTransactionEvent event, Emitter<TransactionState> emit) async {
    await transactionService.deleteTransaction(event.transactionId);

    emit(state.copyWith(
      transactions: state.transactions
          .where((transaction) => transaction.id != event.transactionId)
          .toList(),
    ));

    await transactionService.getRecentTransactions().forEach(
          (recentTransactions) => emit(
            state.copyWith(
              recentTransactions: recentTransactions,
            ),
          ),
        );
  }
}
