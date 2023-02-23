import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_expense_tracker/features/chart/widgets/chart.dart';
import 'package:flutter_expense_tracker/features/transaction/cubit/transaction_bloc.dart';
import 'package:flutter_expense_tracker/features/transaction/cubit/transaction_state.dart';
import 'package:flutter_expense_tracker/features/transaction/widgets/create_transaction_form.dart';
import 'package:flutter_expense_tracker/features/transaction/widgets/transaction_list.dart';
import 'package:flutter_expense_tracker/utils/bottom_sheet/bottom_sheet_controller.dart';

class AppFragment extends StatefulWidget {
  const AppFragment({
    super.key,
  });

  @override
  State<AppFragment> createState() => _AppFragmentState();
}

class _AppFragmentState extends State<AppFragment> {
  final bottomSheetController = BottomSheetController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TransactionBloc(),
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
            floatingActionButton: FloatingActionButton(
              child: const Icon(Icons.add),
              onPressed: () => bottomSheetController.showBaseBottomSheet(
                context,
                CreateTransactionForm(),
              ),
            ),
          );
        },
      ),
    );
  }
}
