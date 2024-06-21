import 'package:flutter/material.dart';

class MobileBankingScreen extends StatefulWidget {
  @override
  _MobileBankingScreenState createState() => _MobileBankingScreenState();
}

class _MobileBankingScreenState extends State<MobileBankingScreen> {
  final _amountController = TextEditingController();
  final _phoneNumberController = TextEditingController();

  void _performTransaction(String transactionType) {
    // Here you would typically call your backend service or directly integrate with MNO APIs
    // For the purpose of this example, we'll just show a Snackbar
    double? amount = double.tryParse(_amountController.text);
    String phoneNumber = _phoneNumberController.text;
    if (amount != null && amount > 0 && phoneNumber.isNotEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('$transactionType of \$${amount} to $phoneNumber successful!')),
      );
      _amountController.clear();
      _phoneNumberController.clear();
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Invalid amount or phone number')),
      );
    }
  }

  @override
  void dispose() {
    _amountController.dispose();
    _phoneNumberController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Mobile Banking'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Text(
                'Mobile Banking Transaction',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              TextFormField(
                controller: _phoneNumberController,
                decoration: InputDecoration(labelText: 'Phone Number'),
                keyboardType: TextInputType.phone,
              ),
              TextFormField(
                controller: _amountController,
                decoration: InputDecoration(labelText: 'Amount'),
                keyboardType: TextInputType.number,
              ),
              SizedBox(height: 10),
              ElevatedButton(
                onPressed: () => _performTransaction('Deposit'),
                child: Text('Deposit'),
              ),
              ElevatedButton(
                onPressed: () => _performTransaction('Withdrawal'),
                child: Text('Withdraw'),
              ),
              ElevatedButton(
                onPressed: () => _performTransaction('Check Balance'),
                child: Text('Check Balance'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
