import 'package:hive_flutter/hive_flutter.dart';

part 'transaction.g.dart';

@HiveType(typeId: 1)
class Transaction extends HiveObject {
  @HiveField(0)
  final DateTime date;
  @HiveField(1)
  final String description;
  @HiveField(2)
  final double amount;

  Transaction(
      {required this.date, required this.description, required this.amount});
}
