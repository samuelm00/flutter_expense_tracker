import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_expense_tracker/features/chart/widgets/chart.dart';
import 'package:flutter_expense_tracker/features/transaction/cubit/transaction_bloc.dart';
import 'package:flutter_expense_tracker/features/transaction/cubit/transaction_event.dart';
import 'package:flutter_expense_tracker/features/transaction/cubit/transaction_state.dart';
import 'package:flutter_expense_tracker/features/transaction/widgets/transaction_list.dart';
import "package:flutter_expense_tracker/features/transaction/widgets/create_transaction_fb.dart";

class AppFragment extends StatelessWidget {
  const AppFragment({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TransactionBloc()
        ..add(const TransactionFetchEvent())
        ..add(const TransactionFetchReventEvent()),
      child: BlocBuilder<TransactionBloc, TransactionState>(
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              title: const Text("Expense Tracker"),
            ),
            body: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Chart(
                    recentTransactions: state.recentTransactions,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  TransactionList(
                    transactions: state.transactions,
                  ),
                ],
              ),
            ),
            floatingActionButton: CreateTransactionFB(),
          );
        },
      ),
    );
  }
}
