import 'package:personal_banking/models/transaction.dart';

List<BankTransaction> getTransactionsFromCSV(String csvAsString) {
  List<String> csvRows = csvAsString.split('\n');
  csvRows.removeAt(0); // remove header

  List<BankTransaction> bankTransactions = csvRows.map((e) {
    List<String> result = [];

    RegExp exp = RegExp(r'"([^"]*)"');
    Iterable<Match> matches = exp.allMatches(e);

    for (Match match in matches) {
      result.add(match.group(1)!);
    }

    return BankTransaction.fromList(result);
  }).toList();

  return bankTransactions;
}
