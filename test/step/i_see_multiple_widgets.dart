import 'package:bdd_widget_test/defs.dart';
import 'package:flutter_test/flutter_test.dart';

class StepDefinition {
  @Then('I see multiple {} widgets')
  Future<void> definition() async {}
}

/// Example: Then I see multiple {SomeWidget} widgets
Future<void> iSeeMultipleWidgets(
  WidgetTester tester,
  Type type,
) async {
  expect(find.byType(type), findsWidgets);
}
