import 'package:flutter/material.dart';
import 'package:flutter_expense_tracker/config/dependency_config.dart';
import 'package:flutter_expense_tracker/features/transaction/controllers/transaction_controller/transaction_controller_state.dart';
import 'package:flutter_expense_tracker/services/transaction_service.dart';
import 'package:flutter_expense_tracker/utils/bottom_sheet/bottom_sheet_controller.dart';
import 'package:flutter_expense_tracker/features/transaction/widgets/create_transaction_form.dart';
import 'package:flutter_expense_tracker/models/transaction.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final transactionControllerProvider = StateNotifierProvider.autoDispose<
    TransactionController, AsyncValue<TransactionControllerState>>(
  (ref) => TransactionController(
    transactionService: ref.watch(transactionServiceProvider),
  ),
);

class TransactionController
    extends StateNotifier<AsyncValue<TransactionControllerState>> {
  TransactionController({
    required TransactionService transactionService,
    BottomSheetController? bottomSheetController,
  })  : _transactionService = transactionService,
        _bottomSheetController =
            bottomSheetController ?? BottomSheetController(),
        super(const AsyncValue.loading());

  final TransactionService _transactionService;
  final BottomSheetController _bottomSheetController;

  void _updateState(
    List<Transaction>? transactions,
  ) {
    state = AsyncValue.data(
      state.value?.copyWith(
            transactions: transactions,
          ) ??
          TransactionControllerState(
            transactions: transactions ?? [],
          ),
    );
  }

  Future<void> fetchTransactions() async {
    state = const AsyncValue.loading();
    final transactions = await _transactionService.getTransactions();
    _updateState(transactions);
  }

  Future<void> addNewTransaction(Transaction transaction) async {
    await _transactionService.addTransaction(transaction);
    _updateState([...state.value?.transactions ?? [], transaction]);
  }

  Future<void> deleteTransaction(String id) async {
    await _transactionService.deleteTransaction(id);

    final transactions =
        state.value?.transactions.where((element) => element.id != id).toList();

    _updateState(transactions);
  }

  void startCreateNewTransaction(BuildContext context) {
    _bottomSheetController.showBaseBottomSheet(
      context,
      const CreateTransactionForm(),
    );
  }
}
