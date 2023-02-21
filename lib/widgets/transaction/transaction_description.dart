import 'package:flutter/material.dart';

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
          date.toString(),
          style: const TextStyle(
            color: Colors.grey,
          ),
        ),
      ],
    );
  }
}
