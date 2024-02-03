import 'package:animated_book_widget/src/src.dart';
import 'package:flutter/material.dart';

/// A Flutter widget that displays animated content
/// within a book using a specified delegate.
///
class AnimatedContentWidget extends StatelessWidget {
  /// Creates an [AnimatedContentWidget].
  ///
  /// The [bookAnimation] is the animation controlling the book state.
  ///
  /// The [delegate] is the delegate responsible for building
  /// the animated content.
  ///
  /// The [borderRadius] is the border radius of the book.
  ///
  const AnimatedContentWidget({
    required this.bookAnimation,
    required this.delegate,
    required this.borderRadius,
    super.key,
  });

  /// The animation controlling the book state.
  final Animation<double> bookAnimation;

  /// The delegate responsible for building the animated content.
  final AnimatedContentDelegate delegate;

  /// The border radius of the book.
  final BorderRadius borderRadius;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: borderRadius,
      child: AnimatedBuilder(
        animation: bookAnimation,
        builder: (context, child) => delegate.build(
          context,
          bookAnimation,
          child,
        ),
        child: delegate.contentChild,
      ),
    );
  }
}
