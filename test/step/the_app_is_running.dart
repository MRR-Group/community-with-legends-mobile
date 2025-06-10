import 'package:bdd_widget_test/defs.dart';
import 'package:community_with_legends_mobile/main.dart';
import 'package:flutter_test/flutter_test.dart';

class StepDefinition {
  @Then('The app is running')
  Future<void> definition() async {}
}

Future<void> theAppIsRunning(WidgetTester tester) async {
  await tester.pumpWidget(
    MyApp(
      authToken: '',
    ),
  );
}
