// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter_expense_tracker/app/app.dart';
import 'package:flutter_test/flutter_test.dart';

import 'setup/test_widget_wrapper.dart';

void main() {
  testWidgets('Simple dummy test to verify if app renders',
      (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(
      TestWidgetWrapper.createTestEnvironment(
        const MyApp(),
      ),
    );

    expect(find.byType(MyApp), findsOneWidget);
  });
}
