import 'package:flutter_expense_tracker/models/transaction.dart';
import 'package:intl/intl.dart';

class ChartController {
  ChartController({required this.recentTransactions});

  final List<Transaction> recentTransactions;

  bool isSameDate(DateTime date1, DateTime date2) {
    return date1.day == date2.day &&
        date1.month == date2.month &&
        date1.year == date2.year;
  }

  List<Map> get groupedTransactions {
    return List.generate(
      7,
      (index) {
        final weekday = DateTime.now().subtract(Duration(days: index));

        return {
          "day": DateFormat.E(weekday),
          "amount": recentTransactions
              .where((element) => isSameDate(element.date, weekday))
              .fold(0.0, (sum, element) => sum + element.amount)
        };
      },
    );
  }
}
