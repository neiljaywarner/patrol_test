// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:patrol/patrol.dart';
import 'package:patrol_test/main.dart';

//initial file from sample gives 95% coverage with these lines
// every line but main, 19 out of 20
/*
open coverage/html/index.html
# Generate `coverage/lcov.info` file
flutter test --coverage
# Generate HTML report
# Note: on macOS you need to have lcov installed on your system (`brew install lcov`) to use this:
genhtml coverage/lcov.info -o coverage/html
# Open the report
open coverage/html/index.html
 */
void main() {
  patrolTest('counter is incremented when plus button is tapped',
      (PatrolTester $) async {
    await $.pumpWidget(const MyApp());

    // Verify that our counter starts at 0.
    expect($('0'), findsOneWidget);
    expect($('1'), findsNothing);
    // Tap the '+' icon and trigger a frame.
    await $(Icons.add).tap();

    // Verify that our counter has incremented.
    expect($('1'), findsOneWidget);
    expect($('0'), findsNothing);
  });
}
