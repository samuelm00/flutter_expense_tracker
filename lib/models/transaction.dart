class Transaction {
  final String id;
  final String title;
  final double amount;
  final DateTime date;

  Transaction({
    required this.id,
    required this.title,
    required this.amount,
    required this.date,
  });

  String get getId => id;
  String get getTitle => title;
  double get getAmount => amount;
  DateTime get getDate => date;

  @override
  String toString() {
    return 'Transaction{id: $id, title: $title, amount: $amount, date: $date}';
  }
}
