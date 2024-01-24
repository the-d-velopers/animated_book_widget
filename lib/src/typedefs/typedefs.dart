import 'package:animated_book_list/src/src.dart';
import 'package:flutter/material.dart';

// TODO(any): add documentation here
///
typedef AnimatedBookListBuilder = AnimatedBookWidget Function(
  BuildContext context,
  int index,
);

///
typedef AnimatedBookContentBuilder = Widget Function(
  BuildContext context,
  Animation<double> bookAnimation,
  Widget? child,
);
