import 'package:flutter/material.dart';
import 'package:personal_banking/pages/settings_page.dart';
import 'package:personal_banking/backend/db_manager.dart';
import 'package:personal_banking/models/bank_transaction.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() => _counter++);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        actions: [
          IconButton(
              onPressed: () => Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const SettingsPage())),
              icon: const Icon(Icons.settings))
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextButton(
                onPressed: () async {
                  List<BankTransaction> bankTransactions =
                      await DB.instance.getBankTransactions();

                  print('there are ${bankTransactions.length} transactions');
                },
                child: const Text('Get # of transactions'))
          ],
        ),
      ),
    );
  }
}
