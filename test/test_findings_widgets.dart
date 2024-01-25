import 'package:flutter_test/flutter_test.dart';

import 'constants.dart';
import 'test_to.dart';

// All of tests for verify if the widget was pumped, and the cover and
// the content are descendants of this widget
void testFindingWidgets() {
  testAnimatedBookWidget();

  testCoverWidget();

  testContentWidget();
}

void testAnimatedBookWidget() => testTo(
      'Finding the Animated Book Widget',
      (tester) {
        final animatedBookWidget = find.byWidget(animatedBookWideget);

        expect(animatedBookWidget, findsOneWidget);
      },
    );

void testCoverWidget() => testTo(
      'The Cover Widget is a descendant of Animated Book Widget',
      (tester) {
        final animatedBookWidget = find.byKey(keyWidget);
        final coverWidget = find.byKey(keyCover);

        final descendantCoverWidget = find.descendant(
          of: animatedBookWidget,
          matching: coverWidget,
        );

        expect(descendantCoverWidget, findsOneWidget);
      },
    );

void testContentWidget() => testTo(
      'The Content Widget is a descendant of Animated Book Widget',
      (tester) {
        final animatedBookWidget = find.byKey(keyWidget);
        final coverWidget = find.byKey(keyContent);

        final descendantCoverWidget = find.descendant(
          of: animatedBookWidget,
          matching: coverWidget,
        );

        expect(descendantCoverWidget, findsOneWidget);
      },
    );
