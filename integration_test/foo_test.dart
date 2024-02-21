import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:myequifax/main.dart';
import 'package:patrol/patrol.dart';

void main() {
  patrolTest(
    'counter state is the same after going to home and switching apps',
    (tester) async {
      // Replace later with your app's main widget
      await tester.pumpWidgetAndSettle(MyApp());
      expect(tester('Flutter Demo Home Page'), findsOneWidget);

      await tester(#incrementButton).tap();
      expect(tester('1'), findsOneWidget);
    },
  );
}
