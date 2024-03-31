import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/widgets.dart';
import 'package:personal_banking/pages/settings_page.dart';
import 'package:personal_banking/backend/db_manager.dart';
import 'package:personal_banking/models/bank_transaction.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late List<BankTransaction> bankTransactions;

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
        child: FutureBuilder(
          future: _getFuture(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.hasError) {
                return Center(
                    child: Text('An error has occurred, ${snapshot.error}'));
              } else if (snapshot.hasData) {
                bankTransactions = snapshot.data!;

                return bankTransactions.isNotEmpty
                    ? Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          AspectRatio(
                            aspectRatio: 2.0,
                            child: LineChart(LineChartData(lineBarsData: [
                              LineChartBarData(
                                  spots: bankTransactions
                                      .map((e) => FlSpot(
                                          e.date.microsecondsSinceEpoch
                                              as double,
                                          e.balance))
                                      .toList())
                            ])),
                          )
                        ],
                      )
                    : const Text('Load first');
              }
            }

            return const Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }

  Future<List<BankTransaction>> _getFuture() async {
    return await DB.instance.getBankTransactions();
  }
}
