import 'package:flutter_expense_tracker/features/chart/widgets/chart.dart';
import 'package:flutter_expense_tracker/features/chart/widgets/chart_bar.dart';
import 'package:flutter_expense_tracker/models/transaction.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../helpers/test_app.dart';

void main() {
  testWidgets("Test if the number of bars is equal to 7 for empty transaction",
      (tester) async {
    await tester.pumpWidget(
      TestApp.getTestApp(
        Chart(
          recentTransactions: [],
        ),
      ),
    );

    expect(find.byType(Chart), findsOneWidget);

    // check the number of chart bars
    expect(find.byType(ChartBar), findsNWidgets(7));
  });

  testWidgets(
      "Test if the number of bars is equal to 7 with multiple transactions",
      (tester) async {
    final transactions = List.generate(
      10,
      (index) => Transaction(
        id: index.toString(),
        title: "Test",
        amount: 10,
        date: DateTime.now(),
      ),
    );

    await tester.pumpWidget(
      TestApp.getTestApp(
        Chart(
          recentTransactions: [],
        ),
      ),
    );

    expect(find.byType(Chart), findsOneWidget);

    // check the number of chart bars
    expect(find.byType(ChartBar), findsNWidgets(7));
  });
}
