import 'package:animated_book_list/src/src.dart';
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
  const AnimatedContentWidget({
    required this.bookAnimation,
    required this.delegate,
    super.key,
  });

  /// The animation controlling the book state.
  final Animation<double> bookAnimation;

  /// The delegate responsible for building the animated content.
  final AnimatedContentDelegate delegate;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: bookAnimation,
      builder: (context, child) => delegate.build(
        context,
        bookAnimation,
        child,
      ),
      child: delegate.contentChild,
    );
  }
}
