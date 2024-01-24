import 'package:animated_book_list/src/src.dart';
import 'package:flutter/material.dart';

/// A function signature for building an animated book widget.
typedef AnimatedBookListBuilder = AnimatedBookWidget Function(
  BuildContext context,
  int index,
);

/// A function signature for building the content of an animated book.
typedef AnimatedBookContentBuilder = Widget Function(
  BuildContext context,
  Animation<double> bookAnimation,
  Widget? child,
);
