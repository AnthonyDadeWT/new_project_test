import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:myequifax/main.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('end-to-end test1', () {
    testWidgets('long 500 tap test 1', (tester) async {
      await tester.pumpWidget(const MyApp());
      // Adding this sleep here to allow test to run on Test Labs a little longer
      expect(find.text("Flutter Demo Home Page"), findsOneWidget);
      Finder button = find.byKey(const Key('incrementButton'));
      for (var i = 0; i < 25; i++) {
        await tester.tap(button);
        await tester.pumpAndSettle();
      }
      await tester.pumpAndSettle();
      expect(find.text("25"), findsOneWidget);
    });
  });
}
