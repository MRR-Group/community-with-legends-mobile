import 'package:bdd_widget_test/defs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

class StepDefinition {
  @When('I enter {} into {} input field')
  Future<void> definition() async {}
}

/// Example: When I enter {'text'} into {1} input field
Future<void> iEnterIntoInputField(
  WidgetTester tester,
  String text,
  int index,
) async {
  final textField = find.byType(TextField).at(index);

  await tester.enterText(textField, text);
}
