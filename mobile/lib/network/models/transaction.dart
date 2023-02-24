import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

import '../types/json_map.dart';

part "transaction.g.dart";

@immutable
@JsonSerializable()
class Transaction {
  final String id;
  final String title;
  final double amount;
  final DateTime date;

  const Transaction({
    required this.id,
    required this.title,
    required this.amount,
    required this.date,
  });

  String get getId => id;
  String get getTitle => title;
  double get getAmount => amount;
  DateTime get getDate => date;

  Transaction copyWith({
    String? id,
    String? title,
    double? amount,
    DateTime? date,
  }) {
    return Transaction(
      id: id ?? this.id,
      title: title ?? this.title,
      amount: amount ?? this.amount,
      date: date ?? this.date,
    );
  }

  JsonMap toJson() => _$TransactionToJson(this);

  static Transaction fromJson(JsonMap json) => _$TransactionFromJson(json);
}
