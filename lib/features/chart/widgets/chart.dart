import 'package:flutter/material.dart';
import 'package:flutter_expense_tracker/features/chart/controllers/chart_controller.dart';
import 'package:flutter_expense_tracker/models/transaction.dart';

class Chart extends StatelessWidget {
  Chart({super.key, required List<Transaction> recentTransactions})
      : controller = ChartController(recentTransactions: recentTransactions);

  final ChartController controller;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      margin: EdgeInsets.all(20),
      child: Row(
        children: <Widget>[
          Text("Chart"),
        ],
      ),
    );
  }
}
