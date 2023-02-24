import 'package:flutter_expense_tracker/network/models/transaction.dart';

abstract class TransactionEvent {
  const TransactionEvent();

  List<Object> get props => [];
}

class TransactionFetchEvent extends TransactionEvent {
  const TransactionFetchEvent();
}

class TransactionFetchRecentEvent extends TransactionEvent {
  const TransactionFetchRecentEvent();
}

class CreateTransactionEvent extends TransactionEvent {
  const CreateTransactionEvent(this.transaction);

  final Transaction transaction;

  @override
  List<Object> get props => [transaction];
}

class DeleteTransactionEvent extends TransactionEvent {
  const DeleteTransactionEvent({required this.transactionId});

  final String transactionId;

  @override
  List<Object> get props => [transactionId];
}
