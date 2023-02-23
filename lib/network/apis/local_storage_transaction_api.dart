import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_expense_tracker/network/apis/transaction_api.dart';
import 'package:flutter_expense_tracker/network/models/transaction.dart';
import 'package:rxdart/subjects.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalStorageTransactionApi extends TansactionApi {
  LocalStorageTransactionApi({required this.localStorage}) {
    _init();
  }

  final SharedPreferences localStorage;
  final _transactionController = BehaviorSubject<List<Transaction>>.seeded([]);

  @visibleForTesting
  final String key = 'transactions';

  String? _getValue(String key) => localStorage.getString(key);
  Future<void> _setValue(String key, String value) =>
      localStorage.setString(key, value);

  void _init() {
    final transactions = _getTransactions();
  }

  List<Transaction> _getTransactions() {
    final transactionsJson = _getValue(key);

    if (transactionsJson == null) {
      return [];
    }

    return List<Map<dynamic, dynamic>>.from(
            jsonDecode(transactionsJson) as List)
        .map((jsonMap) =>
            Transaction.fromJson(Map<String, dynamic>.from(jsonMap)))
        .toList();
  }

  @override
  Stream<List<Transaction>> getTransactions() =>
      _transactionController.asBroadcastStream();

  @override
  Future<Transaction> createTransaction(Transaction transaction) async {
    final transactions = [..._transactionController.value, transaction];

    await _setValue(key, json.encode(transactions));
    _transactionController.add(transactions);

    return transaction;
  }

  @override
  Future<void> deleteTransaction(String id) async {
    final transactions = _transactionController.value
        .where((transaction) => transaction.id != id)
        .toList();

    await _setValue(key, json.encode(transactions));
    _transactionController.add(transactions);
  }
}
