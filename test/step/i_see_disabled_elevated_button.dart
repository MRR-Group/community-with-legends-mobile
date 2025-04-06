import 'package:bdd_widget_test/defs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

class StepDefinition {
  @Then('I see disabled elevated button')
  Future<void> definition() async {}
}

/// Example: Then I see disabled elevated button
Future<void> iSeeDisabledElevatedButton(
  WidgetTester tester,
) async {
  final button = find.byType(ElevatedButton);

  expect((tester.firstWidget(button) as ElevatedButton).enabled, false);
}
