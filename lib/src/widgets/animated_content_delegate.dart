import 'package:animated_book_widget/src/src.dart';
import 'package:flutter/material.dart';

/// An abstract class representing the delegate for animated content
/// within a book.
abstract class AnimatedContentDelegate {
  /// Creates an [AnimatedContentDelegate].
  const AnimatedContentDelegate();

  /// Builds and returns the animated content widget.
  ///
  /// The [context] is the build context.
  ///
  /// The [bookAnimation] is the animation controlling the book state.
  ///
  /// The [child] is the optional child widget to be animated.
  Widget build(
    BuildContext context,
    Animation<double> bookAnimation,
    Widget? child,
  );

  /// Returns the content child widget associated with this delegate.
  Widget? get contentChild;
}

/// A default implementation of [AnimatedContentDelegate]
/// with a scaling animation.
class DefaultAnimatedContentDelegate extends AnimatedContentDelegate {
  /// Creates a [DefaultAnimatedContentDelegate].
  ///
  /// The [contentChild] is the widget representing the content.
  const DefaultAnimatedContentDelegate({required this.contentChild});

  @override
  final Widget contentChild;

  @override
  Widget build(
    BuildContext context,
    Animation<double> bookAnimation,
    Widget? child,
  ) {
    final defaultCurveAnimation = CurvedAnimation(
      curve: const Interval(0.5, 1),
      parent: bookAnimation,
    );

    return SizedBox.expand(
      child: Transform(
        alignment: Alignment.center,
        transform: Matrix4.identity()..scale(defaultCurveAnimation.value),
        child: child,
      ),
    );
  }
}

/// An implementation of [AnimatedContentDelegate] that uses a builder function.
class BuilderAnimatedContentDelegate extends AnimatedContentDelegate {
  /// Creates a [BuilderAnimatedContentDelegate].
  ///
  /// The [contentBuilder] is a function that builds the animated content.
  ///
  /// The [contentChild] is the widget representing the content.
  const BuilderAnimatedContentDelegate({
    required this.contentBuilder,
    required this.contentChild,
  });

  /// A function that builds the animated content.
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
