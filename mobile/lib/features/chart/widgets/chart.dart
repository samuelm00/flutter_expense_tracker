import 'package:flutter/material.dart';
import 'package:flutter_expense_tracker/features/chart/controllers/chart_controller.dart';
import 'package:flutter_expense_tracker/features/chart/widgets/chart_bar.dart';
import 'package:flutter_expense_tracker/features/transaction/controllers/transaction_controller.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Chart extends ConsumerWidget {
  Chart({super.key});

  ChartController initChartController(WidgetRef ref) {
    final recentTransactions =
        ref.watch(transactionControllerProvider).recentTransactions;
    return ChartController(recentTransactions: recentTransactions);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final chartController = initChartController(ref);

    return Card(
      elevation: 6,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: chartController.groupedTransactions.map(
            (data) {
              return Flexible(
                fit: FlexFit.tight,
                child: ChartBar(
                  label: data.day,
                  spendingAmount: data.value,
                  spendingPctOfTotal: chartController.totalSpending == 0.0
                      ? 0.0
                      : data.value / chartController.totalSpending,
                ),
              );
            },
          ).toList(),
        ),
      ),
    );
  }
}
