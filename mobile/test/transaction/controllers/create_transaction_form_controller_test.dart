import 'package:flutter_expense_tracker/features/transaction/controllers/create_transaction_form_controller.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

abstract class OnSubmitMock {
  void onSubmit(String title, double amount, DateTime date);
}

class OnSubmitMockImpl extends Mock implements OnSubmitMock {}

void main() {
  testWidgets(
      "handleSubmit() should not be called controllers that have empty texts",
      (widgetTester) async {
    final onSubmitMock = OnSubmitMockImpl();

    final controller =
        CreateTransactionFormController(onSubmit: onSubmitMock.onSubmit);

    verifyNever(onSubmitMock.onSubmit("", 0, DateTime.now()));
  });
}
