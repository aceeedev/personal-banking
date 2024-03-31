import 'dart:io';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:personal_banking/backend/bank_integration.dart';
import 'package:personal_banking/models/transaction.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Settings'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SettingsButton(
              text: 'Upload bank transactions',
              icon: Icons.file_open,
              onPressed: () async {
                FilePickerResult? result =
                    await FilePicker.platform.pickFiles();

                if (result != null) {
                  String csvAsString =
                      String.fromCharCodes(result.files.single.bytes!);

                  List<BankTransaction> list =
                      getTransactionsFromCSV(csvAsString);

                  print(list.length);
                }
              },
            ),
            SettingsButton(
              text: 'Refresh Citi transactions',
              icon: Icons.loop,
              onPressed: () async {
                // TODO: add
              },
            )
          ],
        ),
      ),
    );
  }
}

class SettingsButton extends StatelessWidget {
  const SettingsButton(
      {super.key,
      required this.text,
      required this.icon,
      required this.onPressed});

  final String text;
  final IconData icon;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(bottom: 10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
                padding: const EdgeInsets.only(right: 8.0), child: Text(text)),
            IconButton(onPressed: () async => onPressed(), icon: Icon(icon))
          ],
        ));
  }
}
