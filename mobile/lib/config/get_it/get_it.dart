import 'package:flutter_expense_tracker/network/apis/expense_tracker_api.dart';
import 'package:flutter_expense_tracker/network/apis/local_storage_transaction_api.dart';
import 'package:flutter_expense_tracker/network/apis/transaction_api.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

final getIt = GetIt.instance;

Future<void> setupDependencies() async {
  // getIt.registerSingleton<TransactionApi>(LocalStorageTransactionApi(
  //   localStorage: await SharedPreferences.getInstance(),
  // ));

  getIt.registerSingleton<TransactionApi>(ExpenseTrackerApi());
}
