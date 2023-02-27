import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:flutter_expense_tracker/models/transaction.dart';
import 'package:flutter_expense_tracker/repositories/transaction_repository.dart';

class TransactionHttpRepository implements TransactionRepository {
  TransactionHttpRepository({required this.httpClient});

  final http.Client httpClient;
  final String baseUrl = "http://localhost:5285";

  Uri _constructUri(String path) {
    return Uri.parse(baseUrl + path);
  }

  @override
  Future<Transaction> addTransction(Transaction transaction) async {
    final response = await http.post(
      _constructUri("/transactions"),
      headers: {
        "Content-Type": "application/json",
      },
      body: json.encode(
        transaction.toJson(),
      ),
    );

    if (response.statusCode == 200) {
      return Transaction.fromJson(
        Map<String, dynamic>.from(jsonDecode(response.body)),
      );
    } else {
      throw Exception("Failed to create transaction");
    }
  }

  @override
  Future<void> deleteTransaction(String id) async {
    final response = await http.delete(
      _constructUri("/transactions/$id"),
    );

    if (response.statusCode != 200) {
      throw Exception("Failed to delete transaction");
    }
  }

  @override
  Future<List<Transaction>> getTransactions() async {
    final response = await http.get(_constructUri("/transactions"), headers: {
      "Content-Type": "application/json",
    });

    if (response.statusCode == 200) {
      final List<dynamic> json = jsonDecode(response.body);
      return json
          .map((e) => Transaction.fromJson(Map<String, dynamic>.from(e)))
          .toList();
    } else {
      throw Exception("Failed to get transactions");
    }
  }
}
