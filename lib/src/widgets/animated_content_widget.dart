import 'package:flutter/material.dart';

// TODO(any): add documentation here
///
class AnimatedContentWidget extends AnimatedWidget {
  ///
  const AnimatedContentWidget({
    required super.listenable,
    required this.content,
    super.key,
  });

  ///
  final Widget content;

  ///
  Animation<double> get contentAnimation => listenable as Animation<double>;

  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: Transform(
        alignment: Alignment.center,
        transform: Matrix4.identity()..scale(contentAnimation.value),
        child: content,
      ),
    );
  }
}
