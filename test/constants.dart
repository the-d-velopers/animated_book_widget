import 'package:animated_book_widget/src/widgets/widgets.dart';
import 'package:flutter/material.dart';

// The constants for use in all tests and no repeat

const keyWidget = Key('Animated_Book_Widget');
const keyCover = Key('Animated_Cover');
const keyContent = Key('Animated_Content');

const double width = 400;
const double height = 220;

final animatedBookWideget = AnimatedBookWidget(
  key: keyWidget,
  cover: const ColoredBox(
    key: keyCover,
    color: Colors.green,
  ),
  content: const ColoredBox(
    key: keyContent,
    color: Colors.red,
  ),
  size: const Size(width, height),
);
