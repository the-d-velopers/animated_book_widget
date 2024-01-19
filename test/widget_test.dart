import 'package:animated_book_list/src/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testAnimatedBookWidget();

  testCoverWidget();

  testContentWidget();
}

void testTo(
  String info,
  void Function(WidgetTester tester) expectedCallBack,
) =>
    testWidgets(
      'Animated Book List: $info',
      (WidgetTester tester) async {
        await tester.pumpWidget(
          const MaterialApp(
            home: Scaffold(
              body: Center(
                child: AnimatedBookWidget(
                  cover: ColoredBox(color: Colors.green),
                  content: ColoredBox(color: Colors.red),
                  size: Size(160, 200),
                ),
              ),
            ),
          ),
        );

        expectedCallBack(tester);
      },
    );

void testAnimatedBookWidget() => testTo(
      'Finding the Animated Book Widget',
      (tester) {
        final animatedBookWidget = find.byType(AnimatedBookWidget);

        expect(animatedBookWidget, findsOneWidget);
      },
    );

void testCoverWidget() => testTo(
      'The Cover Widget is a descendant of Animated Book Widget',
      (tester) {
        final animatedBookWidget = find.byType(AnimatedBookWidget);
        final coverWidget = find.byType(AnimatedCoverWidget);

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
        final animatedBookWidget = find.byType(AnimatedBookWidget);
        final coverWidget = find.byType(AnimatedContentWidget);

        final descendantCoverWidget = find.descendant(
          of: animatedBookWidget,
          matching: coverWidget,
        );

        expect(descendantCoverWidget, findsOneWidget);
      },
    );
