class Transaction {
  final int id;
  final int amount;
  final String title;
  final DateTime date;

  Transaction({
    required this.id,
    required this.amount,
    required this.date,
    required this.title,
  });
}
