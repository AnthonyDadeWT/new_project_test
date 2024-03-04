import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:myequifax/main.dart';
import 'package:patrol/patrol.dart';

void main() {
  /*patrolTest(
    'patrol test 1',
    (tester) async {
      // Replace later with your app's main widget
      await tester.pumpWidgetAndSettle(MyApp());
      expect(tester('Flutter Demo Home Page'), findsOneWidget);

      for (int i = 0; i < 25; i++) await tester(#incrementButton).tap();
      await tester.pump();
      expect(tester('0'), findsOneWidget);
    },
  );*/

  patrolTest('Counter increments smoke test', (tester) async {
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
    expect(find.text('25'), findsOneWidget);

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
