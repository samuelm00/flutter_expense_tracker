import 'dart:convert';

import 'package:flutter_expense_tracker/network/apis/transaction_api.dart';
import 'package:flutter_expense_tracker/network/models/transaction.dart';
import 'package:http/http.dart' as http;

class ExpenseTrackerApi extends TransactionApi {
  ExpenseTrackerApi() : super();

  final String baseUrl = "http://localhost:5285";

  Uri _constructUri(String path) {
    return Uri.parse(baseUrl + path);
  }

  @override
  Stream<List<Transaction>> getTransactions() {
    return Stream.fromFuture(
      http.get(
        _constructUri("/transactions"),
      ),
    ).map(
      (response) {
        if (response.statusCode == 200) {
          return List<Map<dynamic, dynamic>>.from(
            jsonDecode(response.body) as List,
          )
              .map(
                (jsonMap) => Transaction.fromJson(
                  Map<String, dynamic>.from(jsonMap),
                ),
              )
              .toList();
        } else {
          throw Exception("Failed to load transactions");
        }
      },
    );
  }

  @override
  Future<Transaction> createTransaction(Transaction transaction) {
    return http
        .post(
      _constructUri("/transactions"),
      headers: {
        "Content-Type": "application/json",
      },
      body: json.encode(transaction.toJson()),
    )
        .then(
      (response) {
        if (response.statusCode == 200) {
          return Transaction.fromJson(
            Map<String, dynamic>.from(jsonDecode(response.body)),
          );
        } else {
          throw Exception("Failed to create transaction");
        }
      },
    );
  }

  @override
  Future<void> deleteTransaction(String id) {
    return http
        .delete(
      _constructUri("/transactions/$id"),
    )
        .then(
      (response) {
        if (response.statusCode != 200) {
          throw Exception("Failed to delete transaction");
        }
      },
    );
  }
}
