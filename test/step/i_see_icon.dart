import 'package:bdd_widget_test/defs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

class StepDefinition {
  @Then('I see {} icon')
  Future<void> definition() async {}
}

/// Example: Then I see {Icons.add} icon
Future<void> iSeeIcon(
  WidgetTester tester,
  IconData icon,
) async {
  expect(find.byIcon(icon), findsOneWidget);
}
