// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_import, directives_ordering

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../step/the_app_is_running.dart';
import '../step/i_see_text.dart';
import '../step/i_tap_icon.dart';
import '../step/i_tap_tooltip.dart';

void main() {
  group('''Counter''', () {
    testWidgets('''Initial counter value is 0''', (tester) async {
      await theAppIsRunning(tester);
      await iSeeText(tester, '0');
    });
    testWidgets('''Counter increments value on click''', (tester) async {
      await theAppIsRunning(tester);
      await iSeeText(tester, '0');
      await iTapIcon(tester, Icons.add);
      await iSeeText(tester, '1');
      await iTapTooltip(tester, 'Increment');
      await iSeeText(tester, '2');
    });
  });
}
