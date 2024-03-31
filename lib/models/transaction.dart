class Transaction {
  final DateTime date;
  final String description;
  final double amount;

  Transaction(
      {required this.date, required this.description, required this.amount});
}

class BankTransaction extends Transaction {
  final String comments;
  final String checkNumber;
  final double balance;

  BankTransaction({
    required super.date,
    required super.description,
    required super.amount,
    required this.comments,
    required this.checkNumber,
    required this.balance,
  });
}

class CitiTransaction extends Transaction {
  final String status;

  CitiTransaction(
      {required super.date,
      required super.description,
      required super.amount,
      required this.status});
}
