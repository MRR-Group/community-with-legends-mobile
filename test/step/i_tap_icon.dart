import 'package:bdd_widget_test/defs.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';

class StepDefinition {
  @When('I tap {} icon')
  Future<void> definition() async {}
}

/// Example: When I tap {Icons.add} icon
Future<void> iTapIcon(
  WidgetTester tester,
  IconData icon,
) async {
  await tester.tap(find.byIcon(icon));
  await tester.pump();
}
