import 'package:flutter/foundation.dart';

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

  factory BankTransaction.fromList(List<dynamic> list) {
    print(list);
    print(list.length);

    String date = list[0].toString().replaceAll('"', '').replaceAll('/', '-');
    date =
        '${date.substring(date.length - 1 - 3)}-${date.substring(0, date.length - 5)}';

    return BankTransaction(
        date: DateTime.parse(date),
        description: list[1].toString().replaceAll('"', ''),
        comments: list[2].toString().replaceAll('"', ''),
        checkNumber: list[3].toString().replaceAll('"', ''),
        amount: double.parse(list[4]
            .toString()
            .replaceAll('"', '')
            .replaceAll('\$', '')
            .replaceAll(',', '')),
        balance: list[5].toString() != ''
            ? double.parse(list[5]
                .toString()
                .replaceAll('"', '')
                .replaceAll('\$', '')
                .replaceAll(',', ''))
            : 0);
  }
}

class CitiTransaction extends Transaction {
  final String status;

  CitiTransaction(
      {required super.date,
      required super.description,
      required super.amount,
      required this.status});
}
