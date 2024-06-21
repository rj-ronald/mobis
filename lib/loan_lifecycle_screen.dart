import 'package:flutter/material.dart';

class LoanLifecycleScreen extends StatefulWidget {
  @override
  _LoanLifecycleScreenState createState() => _LoanLifecycleScreenState();
}

class _LoanLifecycleScreenState extends State<LoanLifecycleScreen> {
  final List<Map<String, dynamic>> loans = [];
  final _amountController = TextEditingController();
  final _repaymentController = TextEditingController();

  void _applyForLoan() {
    double? amount = double.tryParse(_amountController.text);
    if (amount != null && amount > 0) {
      setState(() {
        loans.add({
          'amount': amount,
          'remaining': amount,
        });
      });
      _amountController.clear();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Loan application successful!')),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Invalid amount')),
      );
    }
  }

  void _makeRepayment(int index) {
    double? repayment = double.tryParse(_repaymentController.text);
    if (repayment != null && repayment > 0 && repayment <= loans[index]['remaining']) {
      setState(() {
        loans[index]['remaining'] -= repayment;
      });
      _repaymentController.clear();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Repayment successful!')),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Invalid amount or exceeds remaining balance')),
      );
    }
  }

  @override
  void dispose() {
    _amountController.dispose();
    _repaymentController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Loan Lifecycle Management'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Text(
                'Apply for a Loan',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              TextFormField(
                controller: _amountController,
                decoration: InputDecoration(labelText: 'Loan Amount'),
                keyboardType: TextInputType.number,
              ),
              SizedBox(height: 10),
              ElevatedButton(
                onPressed: _applyForLoan,
                child: Text('Apply'),
              ),
              SizedBox(height: 20),
              Text(
                'Active Loans',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              ...List.generate(loans.length, (index) {
                var loan = loans[index];
                return Card(
                  child: ListTile(
                    title: Text('Loan Amount: \$${loan['amount']}'),
                    subtitle: Text('Remaining Balance: \$${loan['remaining']}'),
                    trailing: IconButton(
                      icon: Icon(Icons.payment),
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: Text('Make Repayment'),
                              content: TextFormField(
                                controller: _repaymentController,
                                decoration: InputDecoration(labelText: 'Repayment Amount'),
                                keyboardType: TextInputType.number,
                              ),
                              actions: <Widget>[
                                TextButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                    _makeRepayment(index);
                                  },
                                  child: Text('Repay'),
                                ),
                              ],
                            );
                          },
                        );
                      },
                    ),
                  ),
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}
