import 'package:flutter/material.dart';

// TODO(any): add documentation here
///
class AnimatedCoverWidget extends AnimatedWidget {
  ///
  const AnimatedCoverWidget({
    required super.listenable,
    required this.cover,
    super.key,
  });

  ///
  final Widget cover;

  ///
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
