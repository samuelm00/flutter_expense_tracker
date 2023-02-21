import 'package:flutter/material.dart';
import 'package:flutter_expense_tracker/widgets/transaction/transaction_feed.dart';

class AppFragment extends StatelessWidget {
  const AppFragment({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Expense Tracker"),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {},
          )
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Card(
            child: Container(
              color: Colors.blue,
              width: double.infinity,
              child: const Text("Chart!"),
            ),
          ),
          const TransactionFeed()
        ],
      ),
    );
  }
}
