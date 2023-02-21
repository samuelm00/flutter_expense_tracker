import 'package:flutter/material.dart';
import 'package:flutter_expense_tracker/features/bottom_sheet/bottom_sheet_controller.dart';
import 'package:flutter_test/flutter_test.dart';

Widget getDummyApp(
    WidgetTester tester, BottomSheetController bottomSheetController) {
  return MaterialApp(
    home: Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            bottomSheetController.showBaseBottomSheet(
              tester.element(find.byType(Scaffold)),
              const ElevatedButton(
                onPressed: null,
                child: Text("OpenedBottomSheet"),
              ),
            );
          },
          child: const Text("ClosedBottomSheet"),
        ),
      ),
    ),
  );
}

void main() {
  testWidgets('Check if BottomSheetController opens Bottom-Sheet',
      (WidgetTester tester) async {
    final BottomSheetController bottomSheetController = BottomSheetController();

    // Build our app and trigger a frame.
    await tester.pumpWidget(getDummyApp(tester, bottomSheetController));

    // bottom sheet should be closed
    expect(find.text("OpenedBottomSheet"), findsNothing);

    // Tap the button and trigger a frame.
    await tester.tap(find.byType(ElevatedButton));
    // Rebuild the widget after the state has changed.
    await tester.pump();

    expect(find.text('OpenedBottomSheet'), findsOneWidget);
  });
}
