// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:myequifax/main.dart';

void main() {
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyApp());

    // Verify that our counter starts at 0.
    expect(find.text('0'), findsOneWidget);
    expect(find.text('1'), findsNothing);

    // Tap the '+' icon and trigger a frame.
    for (int i = 0; i < 25; i++) {
      await tester.tap(find.byIcon(Icons.add));
    }
    await tester.pump();

    // Verify that our counter has incremented.
    expect(find.text('0'), findsNothing);
    expect(find.text('1'), findsOneWidget);

    expect(find.byKey(Key("nextPageButton")), findsOneWidget);
    await tester.tap(find.byKey(Key("nextPageButton")));
    await tester.pumpAndSettle();

    expect(find.text("Testing demo"), findsOneWidget);
    await tester.tap(find.byKey(Key("button")));
    await tester.pumpAndSettle();

    expect(find.text("New text assertion"), findsOneWidget);

    expect(find.byKey(Key("backButton")), findsOneWidget);
    await tester.tap(find.byKey(Key("backButton")));
    await tester.pumpAndSettle();

    expect(find.text('0'), findsOneWidget);
  });
}
