import 'package:bdd_widget_test/defs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

class StepDefinition {
  @When('I see {} rich text')
  Future<void> definition() async {}
}

/// Example: When I see {'text'} rich text
Future<void> iSeeRichText(
  WidgetTester tester,
  String text,
) async {
  final finder = find.byWidgetPredicate(
    (widget) => widget is RichText && widget.text.toPlainText() == text,
  );
  expect(finder, findsOneWidget);
}
