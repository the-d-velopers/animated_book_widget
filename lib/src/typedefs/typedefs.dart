import 'package:flutter/material.dart';

/// A function signature for building the content of an animated book.
typedef AnimatedBookContentBuilder = Widget Function(
  BuildContext context,
  Animation<double> bookAnimation,
  Widget? child,
);
