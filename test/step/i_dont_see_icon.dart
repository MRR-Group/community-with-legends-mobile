import 'package:bdd_widget_test/defs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

class StepDefinition {
  @Then("I don't see {} icon")
  Future<void> definition() async {}
}

/// Example: Then I don't see {Icons.add} icon
Future<void> iDontSeeIcon(
  WidgetTester tester,
  IconData icon,
) async {
  expect(find.byIcon(icon), findsNothing);
}
