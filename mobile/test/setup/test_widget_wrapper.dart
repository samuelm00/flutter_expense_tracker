import 'package:flutter/material.dart';
import 'package:flutter_expense_tracker/config/dependency_config.dart';
import 'package:flutter_expense_tracker/repositories/transactino_http_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

@GenerateNiceMocks([MockSpec<TransactionHttpRepository>()])
import 'test_widget_wrapper.mocks.dart';

class TestWidgetWrapper {
  static final transactionRepositoryMock = MockTransactionHttpRepository();

  static createTestEnvironment(Widget child) {
    when(transactionRepositoryMock.getTransactions())
        .thenAnswer((_) async => []);

    return ProviderScope(
      overrides: [
        transactionRepositoryProvider
            .overrideWith((ref) => transactionRepositoryMock),
      ],
      child: child,
    );
  }
}
