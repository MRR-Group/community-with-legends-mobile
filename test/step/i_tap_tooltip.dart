import 'package:bdd_widget_test/defs.dart';
import 'package:flutter_test/flutter_test.dart';

class StepDefinition {
  @Then('I tap {} tooltip')
  Future<void> definition() async {}
}

/// Usage: I tap {'textTooltip'} tooltip
Future<void> iTapTooltip(WidgetTester tester, dynamic tooltip) async {
  await tester.tap(find.byTooltip(tooltip));
  await tester.pump();
}
