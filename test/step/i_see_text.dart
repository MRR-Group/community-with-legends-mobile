import 'package:bdd_widget_test/defs.dart';
import 'package:flutter_test/flutter_test.dart';

class StepDefinition {
  @When('I see {} text')
  Future<void> definition() async {}
}

/// Example: When I see {'text'} text
Future<void> iSeeText(
  WidgetTester tester,
  String text,
) async {
  expect(find.text(text), findsOneWidget);
}
