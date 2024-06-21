// lib/customer_support_screen.dart
import 'package:flutter/material.dart';

class CustomerSupportScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Customer Support'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            ElevatedButton.icon(
              onPressed: () {
                // Navigate to chat screen
              },
              icon: Icon(Icons.chat_bubble_outline),
              label: Text('Chat with Support'),
            ),
            SizedBox(height: 10),
            ElevatedButton.icon(
              onPressed: () {
                // Navigate to create support ticket screen
              },
              icon: Icon(Icons.add),
              label: Text('Create Support Ticket'),
            ),
            SizedBox(height: 10),
            ElevatedButton.icon(
              onPressed: () {
                // Navigate to view existing tickets screen
              },
              icon: Icon(Icons.list),
              label: Text('View Existing Tickets'),
            ),
            SizedBox(height: 10),
            ElevatedButton.icon(
              onPressed: () {
                // Navigate to FAQs and Help screen
              },
              icon: Icon(Icons.help_outline),
              label: Text('FAQs and Help'),
            ),
            SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: 10, // Replace with the actual count of tickets
                itemBuilder: (context, index) {
                  return Card(
                    child: ListTile(
                      title: Text('Ticket #${index + 1}'),
                      subtitle: Text('Status: Pending'),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
