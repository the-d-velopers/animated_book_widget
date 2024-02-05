import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'constants.dart';

// This function is for pumped the App, and then make sure the tests work
void testTo(
  String info,
  void Function(WidgetTester tester) expectedCallBack,
) =>
    testWidgets(
      'Animated Book Widget Package Test: $info',
      (WidgetTester tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: Center(
                child: animatedBookWidget,
              ),
            ),
          ),
        );

        // All of functionality of test, call below
        expectedCallBack(tester);
      },
    );
