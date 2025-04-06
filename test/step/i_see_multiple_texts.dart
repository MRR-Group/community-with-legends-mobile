import 'package:bdd_widget_test/defs.dart';
import 'package:flutter_test/flutter_test.dart';

class StepDefinition {
  @When('I see multiple {} texts')
  Future<void> definition() async {}
}

/// Example: When I see multiple {'text'} texts
Future<void> iSeeMultipleTexts(
  WidgetTester tester,
  String text,
) async {
  expect(find.text(text), findsWidgets);
}
