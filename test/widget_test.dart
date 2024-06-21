import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mobisupport/main.dart';

void main() {
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    // Build your app and trigger a frame.
    await tester.pumpWidget(MyApp());

    // Verify initial state
    expect(find.text('0'), findsOneWidget); // Ensure '0' is found initially
    expect(find.text('1'), findsNothing);  // Ensure '1' is not found initially

    // Tap the '+' icon and trigger a frame.
    await tester.tap(find.byIcon(Icons.add)); // Tap the add icon
    await tester.pump(); // Rebuild the widget after the state change

    // Verify state after incrementing
    expect(find.text('0'), findsNothing); // Ensure '0' is not found after increment
    expect(find.text('1'), findsOneWidget); // Ensure '1' is found after increment
  });
}
