import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:tracking/main.dart' as app;
import 'package:tracking/auto_export.dart';

void main () {

  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets("update tracking times - test", (WidgetTester tester) async {
    app.main();
    
    await tester.pumpAndSettle();

    //Arrage
    final navigatorState = tester.state<NavigatorState>(find.byType(Navigator));
    final firstTimeOfDaySelector = find.byKey(Key("first_time_selector"));
    final secondTimeOfDaySelector = find.byKey(Key("second_time_selector"));
    final saveButton = find.byKey(Key("save_button"));

    //Act
    await tester.tap(saveButton);
    await tester.pumpAndSettle(Duration(seconds: 4));

    //Assert
    expect(find.text(AppStrings.updatedInformations), findsOneWidget);
    expect(find.text(AppStrings.newTrackingTimes), findsOneWidget);
    navigatorState.pop();
    expect(firstTimeOfDaySelector, findsOneWidget);
    expect(secondTimeOfDaySelector, findsOneWidget);
  });

}