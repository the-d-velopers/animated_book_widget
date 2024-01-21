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

///
abstract class AnimatedContentDelegate {
  ///
  const AnimatedContentDelegate();

  ///
  Widget build(
    BuildContext context,
    Animation<double> bookAnimation,
    Widget? child,
  );

  ///
  Widget? get contentChild;
}

///
class DefaultAnimatedContentDelegate extends AnimatedContentDelegate {
  ///
  const DefaultAnimatedContentDelegate({
    required this.contentChild,
  });

  @override
  final Widget contentChild;

  @override
  Widget build(
    BuildContext context,
    Animation<double> bookAnimation,
    Widget? child,
  ) {
    return SizedBox.expand(
      child: Transform(
        alignment: Alignment.center,
        transform: Matrix4.identity()..scale(bookAnimation.value),
        child: child,
      ),
    );
  }
}

///
class BuilderAnimatedContentDelegate extends AnimatedContentDelegate {
  ///
  const BuilderAnimatedContentDelegate({
    required this.contentBuilder,
    required this.contentChild,
  });

  ///
  final AnimatedBookContentBuilder contentBuilder;

  @override
  final Widget? contentChild;

  @override
  Widget build(
    BuildContext context,
    Animation<double> bookAnimation,
    Widget? child,
  ) {
    return contentBuilder(context, bookAnimation, child);
  }
}
