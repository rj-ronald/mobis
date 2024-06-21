import 'package:flutter/material.dart';

class SavingsAccountOptionsScreen extends StatefulWidget {
  @override
  _SavingsAccountOptionsScreenState createState() => _SavingsAccountOptionsScreenState();
}

class _SavingsAccountOptionsScreenState extends State<SavingsAccountOptionsScreen> {
  final List<String> accountOptions = [
    'Regular Savings Account',
    'Fixed Deposit Account',
    'Recurring Deposit Account',
    'Senior Citizen Savings Account',
    'Child Savings Account',
  ];

  void _selectAccountOption(String option) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('You selected: $option')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Savings Account Options'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: accountOptions.length,
          itemBuilder: (context, index) {
            return Card(
              child: ListTile(
                title: Text(accountOptions[index]),
                onTap: () => _selectAccountOption(accountOptions[index]),
              ),
            );
          },
        ),
      ),
    );
  }
}
