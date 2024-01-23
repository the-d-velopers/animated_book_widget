import 'package:animated_book_list/src/src.dart';
import 'package:flutter/material.dart';

// TODO(any): add documentation here
///
class AnimatedContentWidget extends StatelessWidget {
  ///
  const AnimatedContentWidget({
    required this.bookAnimation,
    required this.delegate,
    super.key,
  });

  ///
  final Animation<double> bookAnimation;

  ///
  final AnimatedContentDelegate delegate;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: bookAnimation,
      builder: (context, child) =>
          delegate.build(context, bookAnimation, child),
      child: delegate.contentChild,
    );
  }
}
