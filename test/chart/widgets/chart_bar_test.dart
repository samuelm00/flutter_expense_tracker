import 'package:flutter/material.dart';
import 'package:flutter_expense_tracker/features/chart/widgets/chart_bar.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../helpers/test_app.dart';

void main() {
  testWidgets('Verify that chart bar renders correctly',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      TestApp.getTestApp(
        const ChartBar(
          label: 'Test',
          spendingAmount: 69.99,
          spendingPctOfTotal: 0.5,
        ),
      ),
    );

    expect(find.byType(ChartBar), findsOneWidget);
    expect(find.text("Test"), findsOneWidget);
    expect(find.text("\$70"), findsOneWidget);
  });

  testWidgets("Verify percentage height of bar", (WidgetTester tester) async {
    await tester.pumpWidget(
      TestApp.getTestApp(
        const ChartBar(
          label: 'Test',
          spendingAmount: 69.99,
          spendingPctOfTotal: 0.5,
        ),
      ),
    );

    // check the height of the chart bar
    final chartBar = tester
        .widget<FractionallySizedBox>(find.byType(FractionallySizedBox).first);
    expect(chartBar.heightFactor, 0.5);
  });
}
