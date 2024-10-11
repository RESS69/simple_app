class Transactions {
  final int? keyID;
  final String title;
  final String brand;
  final String amount;
  final DateTime date;

  Transactions({
    this.keyID,
    required this.title,
    required this.brand,
    required this.amount,
    required this.date,
  });
}
