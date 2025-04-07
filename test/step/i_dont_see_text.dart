import 'package:bdd_widget_test/defs.dart';
import 'package:flutter_test/flutter_test.dart';

class StepDefinition {
  @When("I don't see {} text")
  Future<void> definition() async {}
}

/// Example: When I don't see {'text'} text
Future<void> iDontSeeText(
  WidgetTester tester,
  String text,
) async {
  expect(find.text(text), findsNothing);
}
