import 'package:bdd_widget_test/defs.dart';
import 'package:flutter_test/flutter_test.dart';

class StepDefinition {
  @When('I tap {} text')
  Future<void> definition() async {}
}

/// Example: When I tap {'some'} text
Future<void> iTapText(
  WidgetTester tester,
  String text,
) async {
  await tester.tap(find.text(text));
  await tester.pump();
}
