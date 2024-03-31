import 'package:hive_flutter/hive_flutter.dart';
import 'package:personal_banking/models/bank_transaction.dart';
import 'package:personal_banking/models/citi_transaction.dart';

class DB {
  static const String _bankTransactionsKey = 'bankTransactions';
  static const String _citiBankTransactionsKey = 'bankTransactions';

  static final DB instance = DB._init();
  static Box? _box;

  DB._init();

  Future<Box> get box async {
    if (_box != null) return _box!;

    _box = await Hive.openBox('db');
    return _box!;
  }

  // bank:
  Future<void> saveBankTransactions(
          List<BankTransaction> bankTransactions) async =>
      (await box).put(_bankTransactionsKey, bankTransactions);

  Future<List<BankTransaction>> getBankTransactions() async =>
      (await box).get(_bankTransactionsKey) ?? [];

  Future<void> deleteBankTransactions() async =>
      (await box).delete(_bankTransactionsKey);

  // citi bank:
  Future<void> saveCitiBankTransactions(
          List<CitiTransaction> bankTransactions) async =>
      (await box).put(_citiBankTransactionsKey, bankTransactions);

  Future<List<CitiTransaction>?> getCitiBankTransactions() async =>
      (await box).get(_citiBankTransactionsKey);

  Future<void> deleteCitiBankTransactions() async =>
      (await box).delete(_citiBankTransactionsKey);
}
