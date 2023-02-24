import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_expense_tracker/features/transaction/bloc/transaction_bloc.dart';
import 'package:flutter_expense_tracker/features/transaction/bloc/transaction_state.dart';

class TransactionListenerFactory {
  static List<BlocListener<TransactionBloc, TransactionState>>
      createTransactionListeners() {
    return [
      _createErrorListener(),
      _createCreateListener(),
      _createDeleteListener()
    ];
  }

  static BlocListener<TransactionBloc, TransactionState>
      _createErrorListener() {
    return BlocListener<TransactionBloc, TransactionState>(
      listenWhen: (previous, current) =>
          previous.status == TransactionStatus.failure,
      listener: (context, state) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("Something went wrong"),
          ),
        );
      },
    );
  }

  static BlocListener<TransactionBloc, TransactionState>
      _createDeleteListener() {
    return BlocListener<TransactionBloc, TransactionState>(
      listenWhen: (previous, current) =>
          previous.transactions.length > current.transactions.length,
      listener: (context, state) {
        if (state.status == TransactionStatus.success) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text("Transaction deleted"),
            ),
          );
        }
      },
    );
  }

  static BlocListener<TransactionBloc, TransactionState>
      _createCreateListener() {
    return BlocListener<TransactionBloc, TransactionState>(
      listenWhen: (previous, current) =>
          previous.transactions.length < current.transactions.length,
      listener: (context, state) {
        if (state.status == TransactionStatus.success) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text("Transaction created"),
            ),
          );
        }
      },
    );
  }
}
