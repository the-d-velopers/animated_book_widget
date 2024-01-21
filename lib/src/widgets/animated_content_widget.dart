import 'package:animated_book_list/src/src.dart';
import 'package:flutter/material.dart';

// TODO(any): add documentation here
///
class AnimatedContentWidget extends StatelessWidget {
  ///
  const AnimatedContentWidget({
    required this.bookAnimation,
    required this.contentBuilder,
    required this.contentChild,
    super.key,
  });

  ///
  final Animation<double> bookAnimation;

  ///
  final AnimatedBookContentBuilder contentBuilder;

  ///
  final Widget? contentChild;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: bookAnimation,
      builder: (context, child) => contentBuilder(
        context,
        bookAnimation,
        child,
      ),
      child: contentChild,
    );
  }
}
