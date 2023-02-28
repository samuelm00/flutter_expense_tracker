import 'package:flutter_expense_tracker/features/transaction/controllers/create_transaction_form_controller.dart';
import 'package:flutter_expense_tracker/models/transaction.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

abstract class OnSubmitMock {
  void createTransaction(Transaction transaction);
}

class OnSubmitMockImpl extends Mock implements OnSubmitMock {}

void main() {
  testWidgets(
      "handleSubmit() should not be called controllers that have empty texts",
      (widgetTester) async {
    const title = "title";
    const amount = 100.0;
    final date = DateTime.now();
    final transaction = Transaction(
      id: date.toString(),
      title: title,
      amount: amount,
      date: date,
    );

    final onSubmitMock = OnSubmitMockImpl();

    final controller = CreateTransactionFormController(
        createTransaction: onSubmitMock.createTransaction);

    controller.titleController.text = title;
    controller.amountController.text = amount.toString();
    controller.datePickerController.setSelectedDate(null, date);

    controller.handleSubmit();

    verify(onSubmitMock.createTransaction(transaction)).callCount;
  });
}
