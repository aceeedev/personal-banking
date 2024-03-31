import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:personal_banking/app.dart';
import 'package:personal_banking/models/transaction.dart';
import 'package:personal_banking/models/bank_transaction.dart';

import 'package:personal_banking/models/citi_transaction.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  Hive.registerAdapter(TransactionAdapter());
  Hive.registerAdapter(BankTransactionAdapter());
  Hive.registerAdapter(CitiTransactionAdapter());
  await Hive.initFlutter();

  runApp(const App());
}
