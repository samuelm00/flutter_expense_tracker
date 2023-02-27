import 'package:flutter/material.dart';
import 'package:flutter_expense_tracker/features/transaction/controllers/transaction_controller/transaction_controller.dart';
import 'package:flutter_expense_tracker/models/transaction.dart';
import 'package:flutter_expense_tracker/services/transaction_service.dart';
import 'package:flutter_expense_tracker/utils/bottom_sheet/bottom_sheet_controller.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import '../../setup/test_widget_wrapper.mocks.dart';

@GenerateNiceMocks([MockSpec<BottomSheetController>()])
import "transaction_controller_test.mocks.dart";

class MockBuildContext extends Mock implements BuildContext {}

void main() {
  final mockRepo = MockTransactionHttpRepository();

  testWidgets(
      "verify that controller.addTransaction() calls the repository's addTransaction()",
      (widgetTester) async {
    const title = "title";
    const amount = 100.0;
    final date = DateTime.now();

    when(mockRepo.addTransction(any)).thenAnswer(
      (_) async => Transaction(
        id: DateTime.now().toString(),
        title: title,
        amount: amount,
        date: date,
      ),
    );

    final TransactionService transactionService =
        TransactionService(transactionRepository: mockRepo);

    final controller =
        TransactionController(transactionService: transactionService);

    controller.addNewTransaction(title, amount, date);

    verify(mockRepo.addTransction(any)).called(1);
  });

  testWidgets(
      "verify that controller.deleteTransaction(id) calls the repository's deleteTransaction(id)",
      (widgetTester) async {
    const id = "id";
    when(mockRepo.deleteTransaction(id)).thenAnswer((_) async {});

    final TransactionService transactionService =
        TransactionService(transactionRepository: mockRepo);

    final controller =
        TransactionController(transactionService: transactionService);

    controller.deleteTransaction(id);

    verify(mockRepo.deleteTransaction(id)).called(1);
  });

  testWidgets(
      "verify that controller.fetchTransactions() calls the repository's getTransactions()",
      (widgetTester) async {
    when(mockRepo.getTransactions()).thenAnswer((_) async => []);

    final TransactionService transactionService =
        TransactionService(transactionRepository: mockRepo);

    final controller =
        TransactionController(transactionService: transactionService);

    controller.fetchTransactions();

    verify(mockRepo.getTransactions()).called(1);
  });

  testWidgets(
      "verify that controller.startNewTransaction(context) calls bottomSheetController.showBaseBottomSheet(...)",
      (widgetTester) async {
    final bottomSheetControllerMock = MockBottomSheetController();

    when(bottomSheetControllerMock.showBaseBottomSheet(any, any))
        .thenAnswer((realInvocation) {});

    final TransactionService transactionService =
        TransactionService(transactionRepository: mockRepo);

    final controller = TransactionController(
      transactionService: transactionService,
      bottomSheetController: bottomSheetControllerMock,
    );

    controller.startNewTransaction(MockBuildContext());

    verify(bottomSheetControllerMock.showBaseBottomSheet(any, any)).called(1);
  });
}
