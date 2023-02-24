import 'dart:math';

import 'package:flutter_expense_tracker/features/chart/controllers/chart_controller.dart';
import 'package:flutter_expense_tracker/network/models/transaction.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets(
      'Check if transaction_controller_test groups transactions correctly multiple days',
      (WidgetTester tester) async {
    final weekday = DateTime.now();
    final List<Transaction> transactions = [];

    for (int i = 0; i < 7; i++) {
      transactions.add(Transaction(
        id: 't$i',
        title: 'New Shoes',
        amount: 69.99,
        date: weekday.subtract(Duration(days: i)),
      ));
    }

    final ChartController chartController = ChartController(
      recentTransactions: transactions,
    );

    expect(chartController.recentTransactions.length, 7);

    // every day should have 1 transaction
    expect(
        chartController.recentTransactions
            .where((element) => element.amount == 69.99)
            .length,
        7);
  });

  testWidgets(
      'Check if transaction_controller_test groups transactions correctly single day',
      (WidgetTester tester) async {
    final weekday = DateTime.now();
    final List<Transaction> transactions = [];

    for (int i = 0; i < 7; i++) {
      transactions.add(Transaction(
        id: 't$i',
        title: 'New Shoes',
        amount: 69.99,
        date: weekday,
      ));
    }

    final ChartController chartController = ChartController(
      recentTransactions: transactions,
    );

    expect(chartController.groupedTransactions.length, 7);

    // since the weekday is the same, only one day has transactions
    expect(
        chartController.groupedTransactions
            .where((element) => element.value != 0)
            .length,
        1);
    expect(
        chartController.groupedTransactions
            .where((element) => element.value == 0)
            .length,
        6);
  });
}
