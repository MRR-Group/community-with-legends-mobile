import 'package:bdd_widget_test/defs.dart';
import 'package:flutter_test/flutter_test.dart';

class StepDefinition {
  @Then('I dismiss the page')
  Future<void> definition() async {}
}

/// Example: Then I dismiss the page
Future<void> iDismissThePage(
  WidgetTester tester,
) async {
  await tester.pageBack();
  await tester.pumpAndSettle();
}
