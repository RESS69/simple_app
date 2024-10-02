class Transactions {
  // final String id;
  final int? keyID;
  final String title;
  final String brand;
  final String about;
  final DateTime date;

  Transactions({
    // required this.id,
    this.keyID,
    required this.title,
    required this.brand,
    required this.about,
    required this.date,
  });
}
