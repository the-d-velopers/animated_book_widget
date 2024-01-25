import 'package:flutter/material.dart';

/// A Flutter animated widget that transforms
/// its child using a rotation animation.
class AnimatedCoverWidget extends AnimatedWidget {
  /// Creates an [AnimatedCoverWidget].
  ///
  /// The [listenable] is the object being animated.
  ///
  /// The [cover] is the widget to be transformed by the rotation animation.
  const AnimatedCoverWidget({
    required super.listenable,
    required this.cover,
    super.key,
  });

  /// The widget to be transformed by the rotation animation.
  final Widget cover;

  /// Returns the [Animation<double>] responsible for the rotation animation.
  Animation<double> get coverAnimation => listenable as Animation<double>;

  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: Transform(
        alignment: Alignment.centerLeft,
        transform: Matrix4.identity()
          ..setEntry(3, 2, 0.001)
          ..rotateY(1.65 * coverAnimation.value),
        child: cover,
      ),
    );
  }
}
