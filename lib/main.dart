import 'package:flutter/material.dart';
import 'customer_support_screen.dart';
import 'submit_feedback_screen.dart';
import 'onboarding_screen.dart';
import 'savings_account_options_screen.dart';
import 'transactions_screen.dart';
import 'loan_lifecycle_screen.dart';
import 'mobile_banking_screen.dart'; // Import the MobileBankingScreen

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MOBIS App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SplashScreen(), // Start with SplashScreen
    );
  }
}

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Navigate to HomeScreen after a delay
    Future.delayed(Duration(seconds: 5), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomeScreen()),
      );
    });

    return Scaffold(
      backgroundColor: Color.fromARGB(255, 28, 33, 179), // Set background color of the SplashScreen
      body: Center(
        child: Text(
          'Welcome to Mobis Application',
          style: TextStyle(
            color: Colors.white,
            fontSize: 28.0,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {
  // Define feature tiles data
  final List<FeatureTile> featureTiles = [
    FeatureTile(
      title: 'Member Onboarding',
      icon: Icons.group_add,
      screen: OnboardingScreen(),
    ),
    FeatureTile(
      title: 'Mobile Banking',
      icon: Icons.phone_android,
      screen: MobileBankingScreen(),
    ),
    FeatureTile(
      title: 'Loan Management',
      icon: Icons.account_balance,
      screen: LoanLifecycleScreen(),
    ),
    FeatureTile(
      title: 'Manage Transactions',
      icon: Icons.monetization_on,
      screen: TransactionsScreen(),
    ),
    FeatureTile(
      title: 'Savings Account Options',
      icon: Icons.account_balance_wallet,
      screen: SavingsAccountOptionsScreen(),
    ),
    FeatureTile(
      title: 'Customer Support',
      icon: Icons.headset_mic,
      screen: CustomerSupportScreen(),
    ),
    FeatureTile(
      title: 'Submit Feedback',
      icon: Icons.feedback,
      screen: SubmitFeedbackScreen(),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Welcome!',
          style: TextStyle(
            color: Colors.white,
            fontSize: 35,
          ),
        ),
        backgroundColor: Color.fromARGB(255, 28, 33, 179), // Set background color of the AppBar
      ),
      backgroundColor: Colors.white, // Set background color of the Scaffold body
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 16.0,
            mainAxisSpacing: 16.0,
            childAspectRatio: 1.5,
          ),
          itemCount: featureTiles.length,
          itemBuilder: (context, index) {
            return ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => featureTiles[index].screen),
                );
              },
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white, backgroundColor: Color.fromARGB(255, 28, 33, 179), // Set text color of the ElevatedButton
                elevation: 4.0,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(featureTiles[index].icon, size: 40),
                  SizedBox(height: 10),
                  Text(
                    featureTiles[index].title,
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white), // Set text color of the tile title
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

// Model class for feature tiles
class FeatureTile {
  final String title;
  final IconData icon;
  final Widget screen;

  FeatureTile({required this.title, required this.icon, required this.screen});
}
