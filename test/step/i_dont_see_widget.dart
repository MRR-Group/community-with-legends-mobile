import 'package:bdd_widget_test/defs.dart';
import 'package:flutter_test/flutter_test.dart';

class StepDefinition {
  @Then("I don't see {} widget")
  Future<void> definition() async {}
}

/// Example: Then I don't see {SomeWidget} widget
Future<void> iDontSeeWidget(
  WidgetTester tester,
  Type type,
) async {
  expect(find.byType(type), findsNothing);
}
