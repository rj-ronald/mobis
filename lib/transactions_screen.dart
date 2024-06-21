import 'package:flutter/material.dart';

class TransactionsScreen extends StatefulWidget {
  @override
  _TransactionsScreenState createState() => _TransactionsScreenState();
}

class _TransactionsScreenState extends State<TransactionsScreen> {
  double _balance = 1000.0; // Starting balance
  final _amountController = TextEditingController();

  void _deposit() {
    double? amount = double.tryParse(_amountController.text);
    if (amount != null && amount > 0) {
      setState(() {
        _balance += amount;
      });
      _amountController.clear();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Deposit successful!')),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Invalid amount')),
      );
    }
  }

  void _withdraw() {
    double? amount = double.tryParse(_amountController.text);
    if (amount != null && amount > 0 && amount <= _balance) {
      setState(() {
        _balance -= amount;
      });
      _amountController.clear();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Withdrawal successful!')),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Invalid amount or insufficient balance')),
      );
    }
  }

  @override
  void dispose() {
    _amountController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Manage Transactions'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Text(
              'Current Balance: \$$_balance',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            TextFormField(
              controller: _amountController,
              decoration: InputDecoration(labelText: 'Amount'),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _deposit,
              child: Text('Deposit'),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: _withdraw,
              child: Text('Withdraw'),
            ),
          ],
        ),
      ),
    );
  }
}
