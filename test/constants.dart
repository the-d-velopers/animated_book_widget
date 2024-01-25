import 'package:animated_book_list/src/src.dart';
import 'package:flutter/material.dart';

// The constants for use in all tests and no repeat

const keyWidget = Key('Animated_Book_Widget');
const keyCover = Key('Animated_Cover');
const keyContent = Key('Animated_Content');

const double width = 400;
const double height = 220;

const animatedBookWideget = AnimatedBookWidget(
  key: keyWidget,
  cover: ColoredBox(
    key: keyCover,
    color: Colors.green,
  ),
  content: ColoredBox(
    key: keyContent,
    color: Colors.red,
  ),
  size: Size(width, height),
);
