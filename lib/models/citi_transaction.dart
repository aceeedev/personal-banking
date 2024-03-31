import 'package:hive_flutter/hive_flutter.dart';
import 'package:personal_banking/models/transaction.dart';

part 'citi_transaction.g.dart';

@HiveType(typeId: 2)
class CitiTransaction extends Transaction {
  @HiveField(20)
  final String status;

  CitiTransaction(
      {required super.date,
      required super.description,
      required super.amount,
      required this.status});
}
