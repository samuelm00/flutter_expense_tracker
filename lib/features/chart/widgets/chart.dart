import 'package:flutter/material.dart';
import 'package:flutter_expense_tracker/features/chart/controllers/chart_controller.dart';
import 'package:flutter_expense_tracker/features/chart/widgets/chart_bar.dart';
import 'package:flutter_expense_tracker/models/transaction.dart';

class Chart extends StatelessWidget {
  Chart({super.key, required List<Transaction> recentTransactions})
      : chartController =
            ChartController(recentTransactions: recentTransactions);

  final ChartController chartController;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      margin: const EdgeInsets.all(20),
      child: Row(
        children: chartController.groupedTransactions.map(
          (data) {
            return ChartBar(
              label: data.day,
              spendingAmount: data.value,
              spendingPctOfTotal: chartController.totalSpending == 0.0
                  ? 0.0
                  : data.value / chartController.totalSpending,
            );
          },
        ).toList(),
      ),
    );
  }
}
