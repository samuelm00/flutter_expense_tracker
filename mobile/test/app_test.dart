// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter_expense_tracker/app/app.dart';
import 'package:flutter_expense_tracker/config/get_it/get_it.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  setUp(() {
    SharedPreferences.setMockInitialValues({});
    setupDependencies();
  });
  testWidgets('Simple dummy test to verify if app renders',
      (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    expect(find.byType(MyApp), findsOneWidget);
  });
}
