import 'package:example/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('AnimatedBookList has AppBar', (WidgetTester tester) async {
    await tester.pumpWidget(MyApp());

    final appBarFinder = find.byType(AppBar);

    expect(appBarFinder, findsOneWidget);
  });
  testWidgets('AnimatedBookList has Title in AppBar',
      (WidgetTester tester) async {
    await tester.pumpWidget(MyApp());

    final appBarFinder = find.byType(AppBar);

    final titleFinder = find.descendant(
        of: appBarFinder, matching: find.text('Animated Book List'));

    expect(appBarFinder, findsOneWidget);
    expect(titleFinder, findsOneWidget);
  });
  testWidgets('AnimatedBookList has Image in AppBar',
      (WidgetTester tester) async {
    await tester.pumpWidget(MyApp());

    final appBarFinder = find.byType(AppBar);

    final iconDeveloper = find.descendant(
        of: appBarFinder, matching: find.byType(Image, skipOffstage: false));

    expect(appBarFinder, findsOneWidget);
    expect(iconDeveloper, findsOneWidget);
  });
}
