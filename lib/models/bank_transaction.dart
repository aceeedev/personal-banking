import 'package:hive_flutter/hive_flutter.dart';
import 'package:personal_banking/models/transaction.dart';

part 'bank_transaction.g.dart';

@HiveType(typeId: 3)
class BankTransaction extends Transaction {
  @HiveField(10)
  final String comments;
  @HiveField(11)
  final String checkNumber;
  @HiveField(12)
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
