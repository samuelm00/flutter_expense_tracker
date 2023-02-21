import 'package:flutter/material.dart';
import "package:intl/intl.dart";

class TransactionDescription extends StatelessWidget {
  const TransactionDescription(
      {super.key, required this.title, required this.date});

  final String title;
  final DateTime date;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          DateFormat("d-m-y").format(date),
          style: const TextStyle(
            color: Colors.grey,
          ),
        ),
      ],
    );
  }
}
